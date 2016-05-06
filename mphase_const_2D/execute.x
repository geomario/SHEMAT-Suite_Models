$MPIEXEC -n $1 shem_fw64gnu_const.x -snes_monitor -snes_linesearch_monitor -snes_type newtonls -snes_linesearch_type l2 -ksp_max_it 20 -snes_stol 1e-6 -snes_rtol 1e-6 -snes_atol 1e-50  -ksp_rtol 1e-50 -ksp_atol 1e-50 -da_refine_y 1 -da_refine_x 1 -da_refine_z 1 -ksp_type preonly -pc_type lu -ksp_converged_reason -snes_converged_reason -options_left -ksp_monitor -pc_factor_mat_solver_package mumps
# -pc_hypre_type boomeramg
#-pc_hypre_euclid_levels 1
#-snes_monitor -ksp_monitor_true_residual -snes_converged_reason -ksp_converged_reason
