Model Info: Simple 2D transient model for flow and salt transport which shows the ability of the property module basc to simulate density driven flow of aqueous NaCl solutions. 


Compilation on RWTH Cluster:
module switch intel gcc
make fw nohdf PROPS=basc COMPTYPE=ling64 -j 8

Execution:
./shem_fw64gnu_basc.x -tsolve 4

total cpu time:    0:18.39 min on 4 processes


