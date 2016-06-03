#!/bin/zsh

# Make observations

#-----------------------------------------------Variables ---------------------------------
var_dir="/home/jk125262/shematModelsDir/wave_model"
obs_make_dir="/home/jk125262/ESIM_copy/FortranCode/obs2FromMonitor"
obs_make_dir_input="/home/jk125262/ESIM_copy/FortranCode/obs2FromMonitor/inputdir"

monitor_name="WAVE_TRUE_E0_monitor_1.dat"
monitor_used_name="WAVE_TRUE_E0_monitor_1_USED_AS_OBS.dat"
obs_name="observations_WAVE.dat"

#--------------------------------------------Commands -------------------------------------
if [ -d samples_output ]
then
    ### Go to samples_outpup
    cd samples_output
    if [ -f ${monitor_name} ]
    then
	### Copy the monitor file to the inputdirectory of monitor_obs
	cp ${monitor_name} ${obs_make_dir_input}
	### Rename the monitor file in samples_output to show that
	### it has been used to generate an observations file 
	rename ${monitor_name} ${monitor_used_name} ${monitor_name}  
	
	if [ -d ${obs_make_dir} ]
	then
	    ### Go to the directory of monitor_obs
	    cd ${obs_make_dir}
	    ### Invoke monitor_obs
	    ./monitor_obs
	    
	    if [ -d outputdir ]
	    then
		### Go to the output-directory of monitor_obs
		cd outputdir
		
		if [ -f obs2.dat ]
		then
		    ### Rename observations file to customn name
		    rename obs2.dat ${obs_name} obs2.dat
		    
		    if [ -d ${var_dir} ]
		    then
			### Move observations file to model directory
			mv ${obs_name} ${var_dir}
			### Go to model directory and show contents(maybe turned of for python)
			cd ${var_dir}
			echo 
			#ls --color -o
		    else
			echo ${var_dir}
			echo "model directory is not valid"
			exit 1
		    fi

		else
		    echo "No outputfile generated..."
		    echo "Probably an error during monitor_obs..."
		    exit 1
		fi
			
	    else
		echo "outputdir"
		echo "Does not exist in:"
		pwd
		exit 1
	    fi
		
	else
	    echo ${obs_make_dir}
	    echo "Fortran Code for making obs-file not found."
	    exit 1
	fi
	    
    else
	echo "No monitor file exists inside"
	pwd
	exit 1
    fi
	
else
    echo "samples_output does not exist in this"
    echo "model directory"
    exit 1
fi
