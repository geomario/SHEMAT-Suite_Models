#!/bin/zsh

# Clean output directory
# shematOutputDir/model_output/yyyy_mm_dd_a

#----------------------------Variables-----------------------
this_date=$(date +"%Y_%m_%d")	# Later read in from run.py
dir_letter="a"			# Later read in from run.py

model_dir="${HOME}/shematModelsDir/wave_model"
output_dir="${HOME}/shematOutputDir/wave_output"
# The next three variables are changed below (after input)
new_output_dir="${this_date}/${this_date}_${dir_letter}"
output_enkf_dir="${output_dir}/${new_output_dir}/enkf_output"
output_samples_dir="${output_dir}/${new_output_dir}/samples_output"
output_single_cell_dir="${output_dir}/${new_output_dir}/single_cell_output"

#--------------------------Commands-----------------------

echo "clean_output_py.sh"
if [ -d ${output_dir} ]
then
    cd ${output_dir}
    #echo "Enter the final letter of the new directoryname:"
    read dir_letter
    read this_date
    #echo ${dir_letter}
    new_output_dir="${this_date}/${this_date}_${dir_letter}"
    output_enkf_dir="${output_dir}/${new_output_dir}/enkf_output"
    output_samples_dir="${output_dir}/${new_output_dir}/samples_output"
    output_single_cell_dir="${output_dir}/${new_output_dir}/single_cell_output"
    if [ -d ${new_output_dir} ]
    then
	echo "Clean Directory: ${new_output_dir}" 
	# echo ${new_output_dir}
	if [ -d ${output_samples_dir} ]
	then
	    if [ "$(ls -A ${output_samples_dir})" ]
	    then
		cd ${output_samples_dir}
		rm ./*
	    fi
	    cd ${output_dir}
	    cd ${new_output_dir}
	    rmdir samples_output
	else
	    echo 'samples_output directory did not exist.'
	fi

	if [ -d ${output_enkf_dir} ]
	then
	    if [ "$(ls -A ${output_enkf_dir})" ]
	    then
		cd ${output_enkf_dir}
		rm ./*
	    fi
	    cd ${output_dir}
	    cd ${new_output_dir}
	    rmdir enkf_output
	else
	    echo 'enkf_output directory did not exist.'
	fi

	if [ -d ${output_single_cell_dir} ]
	then
	    if [ "$(ls -A ${output_single_cell_dir})" ]
	    then
		cd ${output_single_cell_dir}
		rm ./*
	    fi
	    cd ${output_dir}
	    cd ${new_output_dir}
	    rmdir single_cell_output
	else
	    echo 'single_cell_output directory did not exist.'
	fi

	cd ${output_dir}
	cd ${new_output_dir}
	if [ -d 'pics' ]
	then
	    if [ "$(ls -A pics)" ]
	    then
		cd pics
		rm ./*
	    fi
	    cd ${output_dir}
	    cd ${new_output_dir}
	    rmdir pics
	else
	    echo 'pics directory did not exist.'
	fi

	
	if [ -d ${output_dir} ]
	then
	    cd ${output_dir}
	    if [ -d ${new_output_dir} ]
	    then
		if [ "$(ls -A ${new_output_dir})" ]
		    then
		    cd ${new_output_dir}
		    rm ./*
		fi
		cd ${output_dir}
		rmdir ${new_output_dir}
	    else
		echo 'Directory does not exist (E1)'
		echo ${new_output_dir}
		exit 
	    fi
	else
	    echo 'Directory does not exist (E2)'
	    echo ${output_dir}
	    exit 
	fi
    else
	echo "Directory does not exist (E3) ${new_output_dir}"
    fi
else
    echo 'Directory does not exist (E4)'
    echo ${output_dir}
    exit 
fi

cd ${output_dir}
# pwd
# ls --color -o
# echo

#cd ${output_dir}/${this_date}
# pwd
# ls --color -o
# echo

echo "clean_output_py.sh done"
echo
cd ${model_dir}
