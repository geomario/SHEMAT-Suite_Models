Model Info: 3D-Model, with pumping (negativ) in the front left corner.


Compilation on RWTH Cluster:
gmake fw hdf lapacksrc blassrc noomp HDF5_LIB=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/lib/ HDF5_MOD=/usr/local_rwth/sw/HDF5/1.10.4/intel_19.0.1.144-intelmpi_2018.4.274/include/ PROPS=const COMPTYPE=lini64

Execution:
./shem_fw64int_const_master_individual.x > out.txt

total cpu time:    0:38.75 min



Comparison:
In the comparison repository can be found a python script (theis_analytical.ipy) and its output, wich compares the results to a analytical solution. 
For personal use the vtk_reader below "# Head from vtk" needs to be updated regarding its input. The h_vtk in the plots my also be changed, if someone wants to compare a different profile.
