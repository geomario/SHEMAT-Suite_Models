Model Info: 1D model for temperature- and massflow

vertical temperature profile influenced by vertical flow

Peclet_analytic first line is flow down, second line is flow up. Its created with the matlab script found in the old repository.

Compilation on RWTH Cluster:
gmake fw COMPTYPE=ling64 PROPS=const noomp -j16

Execution:
./shem_fw64gnu_const

total cpu time:    0:00.04 min on 4 processes


