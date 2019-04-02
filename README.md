Here we collect `SHEMAT-Suite` input files including results. These
may serve as a benchmark test in the future.


Naming convention:

`runmode_propsmodule_description`


Examples: 

`fw_bas_2D-Heat-Transfer`\
`fw_mphase_const_2D-CO2-injection`\
`sm_bas_MonteCarlo`


Every Model folder should contain a `/doc` folder, which describes how
to compile and run the model. And a `/results` folder which collects
the output results. Please also include an empty `/test` folder. This
folder will be used in the automated testing.

A short description of the model can also be put in the `/doc`
folder. This should contain a small note about the runtime needed and
the number of processes used to obtain this runtime. Please include
the hash of the git commit of the compiled source code.


## deltatests ##

In the directory `deltatests`, there are routines for testing
`SHEMAT-Suite` output from new executables against archived output in
the `result` folder of the Modles directories (example:
`SHEMAT-Suite_Models/fw_const_TheisProblem/result`).

To use the routines, change directory to
`SHEMAT-Suite_Models/deltatests`.  Check the specifications in
`compilequick.sh` and `exequick.py` at the beginning of the
scripts. Then, run the following commands.

``` shell
./compilequick.sh
python exequick.py
python runSHEMATtest.py
```

After `./compilequick.sh`, check that the `SHEMAT-Suite`-executable of
your choice was generated in `SHEMAT-Suite_Models/deltatests`.

After `python exequick.py`, check that output has been generated in
`SHEMAT-Suite_Models/runmode_propsmodule_description`.

### Adding new deltatests ###

To add new tests, look at `deltatests/test_fw_const_TheisProblem.py`
and add an analogous python file for the new `SHEMAT-Suite_Model`
directory. This should be possible by copying and changing some
directory specifications. Finally, add an `import` statement and an
`addTest` command in `runSHEMATtest.py`.
