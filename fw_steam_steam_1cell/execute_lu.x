$MPIEXEC -n $1 shem_fw64gnu_steam.x -snes_monitor -snes_linesearch_monitor -snes_type newtonls -snes_linesearch_type basic -ksp_max_it 10000 -snes_stol 1e-8 -snes_rtol 1e-8 -snes_atol 1e-8 -snes_max_it 15 -ksp_type preonly -ksp_rtol 1e-11 -ksp_monitor -pc_type lu -pc_factor_mat_solver_package mumps
#-snes_monitor -ksp_monitor_true_residual -snes_converged_reason -ksp_converged_reason
