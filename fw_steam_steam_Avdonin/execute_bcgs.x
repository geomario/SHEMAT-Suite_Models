$MPIEXEC -n $1 shem_fw64gnu_steam.x -snes_monitor -snes_linesearch_monitor -snes_type newtonls -snes_linesearch_type l2 -ksp_max_it 10000 -snes_stol 1e-50 -snes_atol 1e-4 -snes_rtol 1e-50 -ksp_type bcgs -ksp_rtol 1e-50 -ksp_atol 1e-10 -ksp_monitor -da_refine_y 1 -da_refine_x 1 -da_refine_z 1 -pc_type bjacobi -sub_pc_type ilu -sub_pc_factor_levels 1 -sub_ksp_type preonly -ksp_converged_reason -snes_max_it 10
# -pc_hypre_euclid_levels 4
#-ksp_diagonal_scale -ksp_diagonal_scale_fix -snes_grid_sequence
#-snes_monitor -ksp_monitor_true_residual -snes_converged_reason -ksp_converged_reason
