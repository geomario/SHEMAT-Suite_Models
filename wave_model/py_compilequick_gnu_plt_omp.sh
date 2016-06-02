#!/bin/zsh

# Compile changes in OWN-shemat_suite from this directory

#------------------------------------------------------------------------------------------
#-----------------------------------------------Variables ---------------------------------
#------------------------------------------------------------------------------------------
var_dir="/home/jk125262/shematModelsDir/wave_model"
make_dir="/home/jk125262/ESIM_copy/OWNSHEMATCode/shemat_suite"

new_exe_name="shem_sm_sgsim64gnu_const_own_plt_omp.x"

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
gmake sm COMPTYPE=ling64 PROPS=const   omp              novtk nohdf -j16


#rename 's/shem_sm_sgsim64gnu_const.x/'${new_exe_name}'/;' shem_sm_sgsim64gnu_const.x
rename shem_sm_sgsim64gnu_const.x ${new_exe_name} shem_sm_sgsim64gnu_const.x
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
