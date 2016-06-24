#!/bin/zsh

# Make tec-readable monitor files

#-----------------------------------------------Variables ---------------------------------
var_dir="/home/jk125262/shematModelsDir/wave_model"
samples_dir="${var_dir}/samples_output"
mon_make_dir="/home/jk125262/Code/Fortran/TecplotFromMonitor"
mon_make_dir_input="${mon_make_dir}/inputdir"

monitor_name="WAVE_TRUE_E0_monitor_1.dat"
monitor_used_name="WAVE_TRUE_E0_monitor_1_USED_AS_MON.dat"
new_mon_name="monitor_WAVE.plt"

#--------------------------------------------Commands -------------------------------------
cd samples_output
cp ${monitor_name} ${mon_make_dir_input}
rename ${monitor_name} ${monitor_used_name} ${monitor_name}  

cd ${mon_make_dir}
./monitor_plt
cd outputdir
rename monitor_output_1.plt ${new_mon_name} monitor_output_1.plt
mv ${new_mon_name} ${samples_dir}

cd ${var_dir}
echo
ls --color -o

