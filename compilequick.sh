#!/bin/zsh

# Compile SHEMAT-Suite executable and copy it to model_dir

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
model_dir="${HOME}/SHEMAT-Suite_Models/fw_bas_simpleConvection/"         # "${HOME}/SHEMAT-Suite_Models/fw_const_Example"
make_dir="${HOME}/SHEMAT-Suite"                     # "${HOME}/SHEMAT-Suite"

shem_type="fw"			# "sm", "fw"
shem_type_name="fw"	# "sm_sgsim", "fw"

props="bas"

compiler="lini64"	       # "ling64","lini64"
compiler_name="64int"	       # "64gnu","64int"

flags="hdf noomp -j16" # Flags: "omp","debug","noplt","novtk","nohdf"

#Make-directory existence check
if [ ! -d ${make_dir} ]
then
    echo "   Makefile directory"
    echo ${make_dir}
    echo "   does not exist."
    exit 1
fi

# Go to make_dir
pushd ${make_dir}

#Clean make-directory
gmake cleanall

# Get git branch name
git_branch=$(git rev-parse --abbrev-ref HEAD)

# Check source code for changes
git diff --exit-code --quiet
if [ $? -ge 1 ];
then
    echo "   Unstaged changes in Git repository! Please remove."
    echo "   Branch: ${git_branch}"
    exit 1
fi

git diff --cached --exit-code --quiet
if [ $? -ge 1 ];
then
    echo "   Staged changes in Git repository! Please remove."
    echo "   Branch: ${git_branch}"
    exit 1
fi

#New executable suffix
new_exe_suffix="${shem_type_name}${compiler_name}_${props}_${git_branch}_individual"

#Compilation command
gmake ${shem_type} COMPTYPE=${compiler} PROPS=${props} HDF5_MOD=$HDF5_ROOT/include/ HDF5_LIB=$HDF5_ROOT/lib/ ${flags}

# Catch compilation errors
if [ $? -ge 1 ];
then
    echo ""
    echo "------------------------------------"
    echo "compilequick.sh: Compilation aborted"
    popd
    exit 1
fi

# Rename executable
rename shem_${shem_type_name}${compiler_name}_${props}.x shem_${new_exe_suffix}.x shem_${shem_type_name}${compiler_name}_${props}.x

# Move executable
mv shem_${new_exe_suffix}.x ${model_dir}

# Move Makefile.flags, version.inc
mv Makefile.flags ${model_dir}
mv version.inc ${model_dir}

# Rename Makefile.flags, version.inc
pushd ${model_dir}
rename Makefile.flags Makefile_${new_exe_suffix}.flags Makefile.flags
rename version.inc version_${new_exe_suffix}.inc version.inc

# File with RWTH cluster module configuration
module list -t 2> module_${new_exe_suffix}.inc

# Clean make-directory
popd
gmake cleanall

# Create and move tgz Backup
# gmake tgz
# mv *.tgz ${model_dir}

# Echo paths
echo "--------------------------------------------------------"
echo "Compilation path:"
pwd
popd

echo
echo "Current path:"
pwd
echo
