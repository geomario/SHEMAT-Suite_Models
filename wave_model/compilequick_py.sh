#!/bin/zsh

# Compile shemat_suite executable from model directory

#------------------------------------------------------------------
#-----------------------Variables ---------------------------------
#------------------------------------------------------------------
model_dir="${HOME}/shematModelsDir/wave_model"
make_dir="${HOME}/SHEMAT-Suite"

shem_type="sm"			# "sm", "fw"
read shem_type
shem_type_name="sm_sgsim"	# "sm_sgsim", "fw"
read shem_type_name

props="const"

compiler="ling64"	       # "ling64","lini64"
compiler_name="64gnu"	       # "64gnu","64int"

my_name="py"

flags="omp noplt vtk nohdf -j16" # Flags: "omp","debug","noplt","novtk","nohdf"
read flags
flags_name="vtk_omp"	 # Flags in name.
read flags_name

#New executable name
new_exe_name="shem_${shem_type_name}${compiler_name}_${props}_${flags_name}_${my_name}.x"

#Make-directory existence check
if [ ! -d ${make_dir} ]
then
    echo "   Makefile directory"
    echo ${make_dir}
    echo "   does not exist."
    exit 1
fi

#Clean make-directory
cd ${make_dir}
gmake clean

echo ${shem_type}
echo ${compiler}
echo ${props}
echo ${flags}
#Compilation command 
gmake ${shem_type} COMPTYPE=${compiler} PROPS=${props} ${flags}

#Rename executable
rename shem_${shem_type_name}${compiler_name}_${props}.x ${new_exe_name} shem_${shem_type_name}${compiler_name}_${props}.x

#Move executable
mv ${new_exe_name} ${model_dir}

# Clean make-directory
cd ${make_dir}
gmake clean

# Create and move tgz Backup
cd ${make_dir}
gmake tgz
mv *.tgz ${model_dir}

# Echo paths
echo "--------------------------------------------------------"
echo "Compilation path:"
pwd
echo
cd ${model_dir}
echo "Current path:"
pwd
echo
