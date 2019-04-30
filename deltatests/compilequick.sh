#!/bin/zsh

# Compile SHEMAT-Suite executable and copy it to deltatests_dir

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
deltatests_dir="{deltatests_dir_in}"         # "${HOME}/SHEMAT-Suite_Models/deltatests"
make_dir="{make_dir_in}"                     # "${HOME}/SHEMAT-Suite"

shem_type="{shem_type_in}"			# "sm", "fw"
shem_type_name="{shem_type_name_in}"	# "sm_sgsim", "fw"

props="{props_in}"

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

# Get git branch name
git_branch="{git_branch_in}"

if [ ${git_branch} = $(git rev-parse --abbrev-ref HEAD) ]
then
    echo "   SHEMAT-Suite repository in branch"
    echo ${git_branch}
else
    echo "   SHEMAT-Suite repository not in branch"
    echo ${git_branch}
    exit 1
fi

#New executable suffix
new_exe_suffix="${shem_type_name}${compiler_name}_${props}_${git_branch}"

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
    popd
    exit 1
fi

# Rename executable
rename shem_${shem_type_name}${compiler_name}_${props}.x shem_${new_exe_suffix}.x shem_${shem_type_name}${compiler_name}_${props}.x

# Move executable
mv shem_${new_exe_suffix}.x ${deltatests_dir}

# Clean make-directory
gmake clean

# Create and move tgz Backup
gmake tgz
mv *.tgz ${deltatests_dir}

# Echo paths
echo "--------------------------------------------------------"
echo "Compilation path:"
pwd
popd

echo
echo "Current path:"
pwd
echo
