#!/bin/zsh

# Compile SHEMAT-Suite executable with cmake and copy it to model_dir

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
model_dir="{model_dir_in}"         # "${HOME}/SHEMAT-Suite_Models/fw_const_Example"
make_dir="{make_dir_in}"                     # "${HOME}/SHEMAT-Suite"

shem_type="{shem_type_in}"			# "sm", "fw"
shem_type_name="{shem_type_name_in}"	# "sm_sgsim", "fw"

props="{props_in}"
user="none"

compiler="{compiler_in}"	       # "ling64","lini64"
compiler_name="{compiler_name_in}"	       # "64gnu","64int"

flags="{flags_in}" # Flags: "omp","debug","noplt","novtk","nohdf"

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

# Module configuration (for debugging, remove 2> /dev/null)
module purge 2> /dev/null
module load {module0} 2> /dev/null
module load {module1} 2> /dev/null
module load {module2} 2> /dev/null
module load {module3} 2> /dev/null
module load {module4} 2> /dev/null

# Get git branch name
git_branch="{git_branch_in}"

# git diff --exit-code --quiet
# if [ $? -ge 1 ];
# then
#     echo "   Unstaged changes in Git repository! Please remove."
#     echo "   Branch: ${git_branch}"
#     exit 1
# fi

# git diff --cached --exit-code --quiet
# if [ $? -ge 1 ];
# then
#     echo "   Staged changes in Git repository! Please remove."
#     echo "   Branch: ${git_branch}"
#     exit 1
# fi

if [ ${git_branch} = $(git rev-parse --abbrev-ref HEAD) ]
then
    echo "   SHEMAT-Suite repository in branch"
    echo ${git_branch}
else
    echo "   SHEMAT-Suite repository not yet in branch"
    echo ${git_branch}
    git checkout ${git_branch}
    gmake dep
    echo "   SHEMAT-Suite repository in branch"
    echo ${git_branch}
fi

# Generate dependency file if necessary
if [ ! -e Makefile.dep ]
then
    gmake dep
fi

#New executable suffix
new_exe_suffix="${shem_type_name}${compiler_name}_${props}_${git_branch}"

#Clean make-directory
mkdir build_${props}
pushd build_${props}
cmake -DPROPS=${props} -DUSER=${user} ${flags} ..

#Compilation command 
gmake ${shem_type} -j16

# Catch compilation errors
if [ $? -ge 1 ];
then
    echo ""
    echo "compilequick_cmake.sh: Command:"
    echo "------------------------------------"
    echo "cmake -DPROPS=${props} ${flags} .."
    echo "gmake ${shem_type} -j16"
    echo "------------------------------------"
    echo "compilequick_cmake.sh: Compilation aborted"
    popd
    exit 1
fi

# Rename executable
rename shem_${shem_type_name}64gnu_${props}.x shem_${new_exe_suffix}.x shem_${shem_type_name}64gnu_${props}.x

# Move executable
mv shem_${new_exe_suffix}.x ${model_dir}

# Move Makefile.flags, version.inc
# mv Makefile.flags ${model_dir}
pushd generated
mv version.inc ${model_dir}
popd

# Rename Makefile.flags, version.inc
popd
popd
# rename Makefile.flags Makefile_${new_exe_suffix}.flags Makefile.flags
rename version.inc version_${new_exe_suffix}.inc version.inc

# File with RWTH cluster module configuration
module list -t 2> module_${new_exe_suffix}.inc

# Clean make-directory
pushd ${make_dir}
pushd build_${props}
gmake clean
popd

# Clean SHEMAT-Suite git repository
git clean -f
git checkout -- .

# Create and move tgz Backup
# gmake tgz
# mv *.tgz ${model_dir}
rm -r build_${props}

# Echo paths
echo "--------------------------------------------------------"
echo "Compilation path:"
pwd
popd

echo
echo "Current path:"
pwd
echo
