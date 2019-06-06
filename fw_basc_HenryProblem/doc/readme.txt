Model info: In the Henry saltwater intrusion problem, saltwater is
coming into the system from one side (right) and fresh water from the
other side (left).  For a more detailed description read
"Modified-Henry-Problem_documentation.pdf".

In the comparison repository the files "henry_head.txt",
"henry_salinity.txt", "henry_velocity_field.txt" and "henry_XYZ.txt"
are used in the plot_velocity.m. These are the results of the
computation, out of the
henry_final.vtk. "analytic_sol_simpson-and-clement-2004.txt" is also
used in the matlab script.

Compilation on RWTH Cluster:
gmake fw hdf noomp PROPS=basc HDF5_MOD=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/include/ HDF5_LIB=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/lib/ COMPTYPE=lini64

Compilation outputs
Makefile_fw64int_basc_master_individual.flags
module_fw64int_basc_master_individual.inc
version_fw64int_basc_master_individual.inc

Execution:
./shem_fw64int_basc_master_individual.x

total cpu time:    0: 4.13 min
