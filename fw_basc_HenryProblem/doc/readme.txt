Model info: In the Henry saltwater intrusion problem, saltwater is coming into the system from one side (right) and fresh water from the other side (left).  For a more detailed description read "Modified-Henry-Problem_documentation.pdf".

In the comparison repository the files "henry_head.txt", "henry_salinity.txt", "henry_velocity_field.txt" and "henry_XYZ.txt" are used in the plot_velocity.m. These are the results of the computation, out of the henry_final.vtk. "analytic_sol_simpson-and-clement-2004.txt" is also used in the matlab script.

#not compilated yet!!!
#Compilation on RWTH Cluster:
#module switch intel gcc
#make fw nohdf PROPS=basc COMPTYPE=ling64 -j 8

Execution:
./shem_fw64int_basc.x -tsolve 4

total cpu time:    0: 3.46 min
