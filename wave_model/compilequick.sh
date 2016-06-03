#!/bin/zsh

# Compile shemat_suite executable from model directory

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
model_dir="/home/jk125262/shematModelsDir/wave_model"
make_dir="/home/jk125262/ESIM_copy/OWNSHEMATCode/shemat_suite"

shem_type="sm"			# "sm", "fw"
shem_type_name="sm_sgsim"	# "sm_sgsim", "fw"

props="const"
compiler="ling64"	       # "ling64","lini64"
compiler_name="64gnu"	       # "64gnu","64int"

flags="omp noplt vtk nohdf -j16" # Flags: "omp","debug","noplt","novtk","nohdf"
flags_name="own_vtk_omp"	 # Flags in name.

#New executable name
new_exe_name="shem_${shem_type_name}${compiler_name}_${props}_${flags_name}.x"

#Make-directory existence check
if [ ! -d ${make_dir} ]
then
    echo "   Makefile directory"
    echo ${make_dir}
    echo "   does not exist."
    exit
fi

#Clean make-directory
cd ${make_dir}
gmake clean

#Compilation command 
gmake ${shem_type} COMPTYPE=${compiler} PROPS=${props} ${flags}

#Rename executable
rename shem_${shem_type_name}${compiler_name}_${props}.x ${new_exe_name} shem_${shem_type_name}${compiler_name}_${props}.x

#Move executable
mv ${new_exe_name} ${model_dir}

# Clean make-directory
cd ${make_dir}
gmake clean

# Echo paths
echo "--------------------------------------------------------"
echo "Compilation path:"
pwd
echo
cd ${model_dir}
echo "Current path:"
pwd
echo
