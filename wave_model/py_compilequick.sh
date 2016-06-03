#!/bin/zsh

# Compile changes in OWN-shemat_suite from this directory

#------------------------------------------------------------------------------------------
#-----------------------------------------------Variables ---------------------------------
#------------------------------------------------------------------------------------------
var_dir="/home/jk125262/shematModelsDir/wave_model"
make_dir="/home/jk125262/ESIM_copy/OWNSHEMATCode/shemat_suite"

props="const"			# "const","bas","ghe"
flags="hdf HDF5_MOD=/usr/local_rwth/sw/HDF5/1.8.16/gcc-openmpi/include HDF5_LIB=/usr/local_rwth/sw/HDF5/1.8.16/gcc-openmpi/lib/ noomp noplt -j16" # "nohdf"


new_exe_name="shem_fw64gnu_${props}.x"

#------------------------------------------------------------------------------------------
#--------------------------------------------Commands -------------------------------------
#------------------------------------------------------------------------------------------
if [ ! -d ${make_dir} ]
then
    echo "   Makefile directory"
    echo ${make_dir}
    echo "   does not exist."
    exit
fi

cd ${make_dir}
gmake clean
gmake fw COMPTYPE=ling64 PROPS=${props} ${flags}

rename shem_fw64gnu_${props}.x ${new_exe_name} shem_fw64gnu_${props}.x
mv ${new_exe_name} ${var_dir}
echo "--------------------------------------------------------"
echo "Compilation path:"
pwd
echo
cd ${var_dir}
echo "Current path:"
pwd
echo
ls --color -o
