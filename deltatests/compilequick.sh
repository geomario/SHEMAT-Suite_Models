#!/bin/zsh

# Compile SHEMAT-Suite executable and copy it to model_dir

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
model_dir="${HOME}/SHEMAT-Suite_Models/deltatests"
make_dir="${HOME}/SHEMAT-Suite"

shem_type="fw"			# "sm", "fw"
shem_type_name="fw"	# "sm_sgsim", "fw"

props="const"

compiler="ling64"	       # "ling64","lini64"
compiler_name="64gnu"	       # "64gnu","64int"

flags="omp noplt vtk nohdf -j16" # Flags: "omp","debug","noplt","novtk","nohdf"

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

# Get git branch name
git_branch=$(git rev-parse --abbrev-ref HEAD)

#New executable name
new_exe_name="shem_${shem_type_name}${compiler_name}_${props}_${git_branch}.x"

#Clean make-directory
gmake clean

#Compilation command 
gmake ${shem_type} COMPTYPE=${compiler} PROPS=${props} ${flags}

# Catch compilation errors
if [ $? -ge 1 ];
then
    echo ""
    echo "------------------------------------"
    echo "compilequick.sh: Compilation aborted"
    exit 1
fi

#Rename executable
rename shem_${shem_type_name}${compiler_name}_${props}.x ${new_exe_name} shem_${shem_type_name}${compiler_name}_${props}.x

#Move executable
mv ${new_exe_name} ${model_dir}

# Clean make-directory
gmake clean

# Create and move tgz Backup
gmake tgz
mv *.tgz ${model_dir}

# Echo paths
echo "--------------------------------------------------------"
echo "Compilation path:"
pwd
popd

echo
echo "Current path:"
pwd
echo
