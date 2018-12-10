#!/bin/zsh

# Run SHEMAT-Suite executable from deltatests_dir in model_dir

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
shemat_suite_models_dir="${HOME}/SHEMAT-Suite_Models"

shem_type_name="fw"			# "sm", "fw"
compiler_name="64gnu"	       # "64gnu","64int"
props="const"
model_name="TheisProblem"

git_branch="release"

# deltatests_dir
deltatests_dir="${shemat_suite_models_dir}/deltatests"

# model_dir
model_dir="${shemat_suite_models_dir}/${shem_type_name}_${props}_${model_name}"

# exe_name
exe_name="shem_${shem_type_name}${compiler_name}_${props}_${git_branch}.x"

# deltatests_dir existence check
if [ ! -d ${deltatests_dir} ]
then
    echo "   deltatests_dir"
    echo ${deltatests_dir}
    echo "   does not exist."
    exit 1
fi

# model_dir existence check
if [ ! -d ${model_dir} ]
then
    echo "   model_dir"
    echo ${model_dir}
    echo "   does not exist."
    exit 1
fi

# Go to model_dir
pushd ${deltatests_dir}

# exe_name existence check
if [ ! -e ${exe_name} ]
then
    echo "   exe_name"
    echo ${exe_name}
    echo "   does not exist."
    popd
    exit 1
fi

# Copy executable
cp ${exe_name} ${model_dir}
popd

# Run executable
pushd ${model_dir}
./${exe_name}
popd
