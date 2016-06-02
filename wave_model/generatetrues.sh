#!/bin/zsh

# Generate trues from .plt in samples output

#-----------------------------------------------Variables ---------------------------------
var_dir="/home/jk125262/shematModelsDir/wave_model"

general_name="WAVE_TRUE_E0_1.plt"
general_chem_name="WAVE_TRUE_E0_1_chem.plt"
general_name_used="WAVE_TRUE_E0_1_USED_AS_TRUE.plt"
general_chem_name_used="WAVE_TRUE_E0_1_chem_USED_AS_TRUE.plt"
true_name="TrueWAVE.plt"
true_chem_name="TrueWAVE_chem.plt"
#--------------------------------------------Commands -------------------------------------
if [ -d samples_output ]
then
    cd samples_output
    if [   -f ${general_name} -a  -f ${general_chem_name} -a -d ${var_dir} ] 
    then
	cp ${general_name} ${var_dir}
	cp ${general_chem_name} ${var_dir}
	rename ${general_name} ${general_name_used} ${general_name}
	rename ${general_chem_name} ${general_chem_name_used} ${general_chem_name}

	cd ${var_dir}
	rename ${general_name} ${true_name} ${general_name}
	rename ${general_chem_name} ${true_chem_name} ${general_chem_name}
	echo "Current path:"
	pwd
	echo
	### Turned off for python usage
	#ls --color -o
    else
	echo "  At least one of the following does not exist: this directory"
	echo
	echo ${var_dir}
	echo
	echo "  or any of these files"
	echo
	echo ${general_name}
	echo ${general_chem_name}
	echo
	echo "  Check if you used .plt!!!"
	exit 1 
    fi
else
    echo "samples_output does not exist in"
    pwd
    exit 1
fi
    