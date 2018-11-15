Code Compilation on RWTH Cluster:

module switch intel gcc
make fw nohdf PROPS=const COMPTYPE=ling64 -j 8

Model Execution:
./shem_fw64gnu_const.x > out.txt

