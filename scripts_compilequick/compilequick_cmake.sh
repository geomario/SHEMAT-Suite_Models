#!/bin/zsh

# Compile SHEMAT-Suite executable with cmake and copy it to model_dir

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
model_dir="${HOME}/SHEMAT-Suite_Models/fw_const_TheisProblem/"         # "${HOME}/SHEMAT-Suite_Models/fw_const_Example"
make_dir="${HOME}/SHEMAT-Suite"                     # "${HOME}/SHEMAT-Suite"

shem_type="fw"			# "sm", "fw"
shem_type_name="fw"	# "sm_sgsim", "fw"

props="const"
user="none"

compiler="lini64"	       # "ling64","lini64"
compiler_name="64gnu"	       # Currently always gnu for cmake
compiler_name_new="64int"      # "64gnu","64int"

flags="-Dhdf=ON -Domp=OFF -j16" # Flags: "-Domp=ON","-Dhdf=ON","-Ddetails=ON"

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

# Generate dependency file if necessary
if [ ! -e Makefile.dep ]
then
    gmake dep
fi

#Clean make-directory
gmake cleanall

#New executable suffix
new_exe_suffix="${shem_type_name}${compiler_name_new}_${props}_${git_branch}_quick"

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
rename shem_${shem_type_name}${compiler_name}_${props}.x shem_${new_exe_suffix}.x shem_${shem_type_name}${compiler_name}_${props}.x

# Move executable
mv shem_${new_exe_suffix}.x ${model_dir}

# Move CMakeCache.txt, version.inc
mv CMakeCache.txt ${model_dir}
pushd generated
mv version.inc ${model_dir}
popd

# Rename CMakeCache.txt, version.inc
pushd ${model_dir}
rename CMakeCache.txt CMakeCache_${new_exe_suffix}.txt CMakeCache.txt
rename version.inc version_${new_exe_suffix}.inc version.inc

# File with RWTH cluster module configuration
module list -t 2> module_${new_exe_suffix}.inc

# Clean SHEMAT-Suite git repository
popd
git clean -f

# Create and move tgz Backup
popd
# gmake tgz
# mv *.tgz ${model_dir}
git checkout -- .
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
