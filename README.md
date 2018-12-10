Here we collect `SHEMAT-Suite` input files including results. These
may serve as a benchmark test in the future.


Naming convention:

`runmode_props-module_Description`


Examples: 

`fw_bas_2D-Heat-Transfer`\
`fw_mphase_const_2D-CO2-injection`\
`sm_bas_MonteCarlo`


Every Model folder should contain a `/doc` folder, which describes how
to compile and run the model. And a `/results` folder which collects
the output results.  A short description of the model can also be put
in the `/doc` folder. This should contain a small note about the
runtime needed and the number of processes used to obtain this
runtime.


## deltatests ##

In the directory `deltatests`, there are routines to easily test
`SHEMAT-Suite` output from new executables against the archived output
in the `SHEMAT-Suite_Models` directories.

To use the routines, go into `deltatests` and apply a number of
commands.

	cd ~/SHEMAT-Suite_Models/deltatests
	./compilequick.sh
	./exequick.sh
	python runSHEMATtest.py

Check in `compilequick.sh` and `exequick.sh` that the right
specifications are given at the beginning of the scripts.

To add new tests, look at `test_fw_const_TheisProblem.py` and add a
new analogous file for another `SHEMAT-Suite_Model` directory. This
should be possible by copying and changing some directory
specifications. Finally, add an `import` statement and an `addTest`
command in `runSHEMATtest.py`.
