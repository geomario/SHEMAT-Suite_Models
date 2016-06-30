#!/bin/zsh

# Move files from temporary output folders to
# shematOutputDir/model_output/yyyy_mm_dd_a


#Deletes the files with P or monitor in samples_output

#----------------------------Variables-----------------------
model_dir="${HOME}/shematModelsDir/wave_model"
output_dir="${HOME}/shematOutputDir/wave_output"

input_file="WAVE"
enkf_input_file="WAVE.enkf"
true_input_file="WAVE_TRUE"
true_sgsim_file="sgsim_k_wave_true.par"
sgsim_file="sgsim_k_wave.par"
true_log_file="logk_wave_true.dat"
log_file="logk_wave.dat"
shell_output_file="wave.out"
init_dist_file_one="init_dist_wave_1.dat"
init_dist_file_two="init_dist_wave_2.dat"
init_dist_file_three="init_dist_wave_3.dat"
observations_file="observations_WAVE.dat"
true_file="TrueWAVE.plt"
true_chem_file="TrueWAVE_chem.plt"
tgz_date=$(date +"%d%m%y")
tgz_file="shemat_suite-${tgz_date}.tgz"
echo ${tgz_file}
#--------------------------Commands-----------------------

# Make the new output directories
if [ -d ${output_dir} ]
then
    cd ${output_dir}
    echo "Enter the final letter of the new directoryname:"
    read dir_letter
    this_date=$(date +"%Y_%m_%d")
    new_output_dir="${this_date}/${this_date}_${dir_letter}"
    output_enkf_dir="${output_dir}/${new_output_dir}/enkf_output"
    output_samples_dir="${output_dir}/${new_output_dir}/samples_output"
    output_single_cell_dir="${output_dir}/${new_output_dir}/single_cell_output"
    if [ ! -d ${new_output_dir} ]
    then
	echo  ${new_output_dir}
	if [ ! -d ${this_date} ]
	then
	    mkdir ${this_date}
	fi
	mkdir ${new_output_dir}
	cd ${new_output_dir}
	mkdir samples_output
	mkdir enkf_output
	mkdir single_cell_output
    else
	echo ${new_output_dir}
	echo 'Directory already exists'
	echo 'You may use clean_output.sh'
	exit 1
    fi

# Copy the inputfiles to the output directory
    cd ${model_dir}
    if [ -f ${input_file} ]
    then 
	cp ${input_file}  ${output_dir}
	cd ${output_dir}
	mv ${input_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${enkf_input_file} ]
    then 
	cp ${enkf_input_file}  ${output_dir}
	cd ${output_dir}
	mv ${enkf_input_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${true_input_file} ]
    then 
	cp ${true_input_file}  ${output_dir}
	cd ${output_dir}
	mv ${true_input_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${true_sgsim_file} ]
    then 
	cp ${true_sgsim_file}  ${output_dir}
	cd ${output_dir}
	mv ${true_sgsim_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${true_log_file} ]
    then 
	cp ${true_log_file}  ${output_dir}
	cd ${output_dir}
	mv ${true_log_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${shell_output_file} ]
    then 
	cp ${shell_output_file}  ${output_dir}
	cd ${output_dir}
	mv ${shell_output_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${sgsim_file} ]
    then 
	cp ${sgsim_file}  ${output_dir}
	cd ${output_dir}
	mv ${sgsim_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${log_file} ]
    then 
	cp ${log_file}  ${output_dir}
	cd ${output_dir}
	mv ${log_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${init_dist_file_one} ]
    then 
	cp ${init_dist_file_one}  ${output_dir}
	cd ${output_dir}
	mv ${init_dist_file_one}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${init_dist_file_two} ]
    then 
	cp ${init_dist_file_two}  ${output_dir}
	cd ${output_dir}
	mv ${init_dist_file_two}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${init_dist_file_three} ]
    then 
	cp ${init_dist_file_three}  ${output_dir}
	cd ${output_dir}
	mv ${init_dist_file_three}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${observations_file} ]
    then 
	cp ${observations_file}  ${output_dir}
	cd ${output_dir}
	mv ${observations_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${true_file} ]
    then 
	cp ${true_file}  ${output_dir}
	cd ${output_dir}
	mv ${true_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${true_chem_file} ]
    then 
	cp ${true_chem_file}  ${output_dir}
	cd ${output_dir}
	mv ${true_chem_file}  ${new_output_dir}
    fi
    cd ${model_dir}
    if [ -f ${tgz_file} ]
    then
	echo "Exists ${tgz_file}"
	cp ${tgz_file}  ${output_dir}
	cd ${output_dir}
	mv ${tgz_file}  ${new_output_dir}
    fi
    cd ${model_dir}


# Move the outputfiles to the output directory
    cd ${model_dir}
    # Delete all but the first 29 samples
    find samples_output -type f -name '*[2-9][0-9]*' ! -name '*time_out*' -delete
    find samples_output -type f -name '*[0-9][0-9][0-9]*' ! -name '*time_out*' -delete
    cd samples_output
    # Delete all the files with P and monitor!!!!!
    # rm *P*.dat
    #rm *monitor*.dat

    mv * ${output_samples_dir}

    cd ${model_dir}
    cd enkf_output
    mv * ${output_enkf_dir}

    cd ${model_dir}
    cd single_cell_output
    mv * ${output_single_cell_dir}

# Copy exist.txt files back to original directory
    cd ${output_samples_dir}
    cp exist.txt ${model_dir}
    cd ${model_dir}
    mv exist.txt samples_output

    cd ${output_enkf_dir}
    cp exist.txt ${model_dir}
    cd ${model_dir}
    mv exist.txt enkf_output

    cd ${output_single_cell_dir}
    cp exist.txt ${model_dir}
    cd ${model_dir}
    mv exist.txt single_cell_output

# Go back to starting point
    cd ${output_dir}
    pwd
    ls --color -o
    echo

    cd ${output_dir}/${this_date}
    pwd
    ls --color -o
    echo

    cd ${output_dir}/${new_output_dir}
    pwd
    ls --color -o
    echo

    cd ${model_dir}
else
    echo 'Directory does not exist ${output_dir}'
fi
