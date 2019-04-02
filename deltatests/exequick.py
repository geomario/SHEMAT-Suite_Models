'''
Run SHEMAT-Suite executable from deltatests_dir in model_dir
'''
import os
import exceptions
import shutil
import subprocess
from pskf.tools.run import runmodule as rm

###############################################################################
#                                    Input                                    #
###############################################################################
shemat_suite_models_dir = os.environ['HOME'] + "/SHEMAT-Suite_Models"

# Compilation input (compare compilequick.sh)
is_comp = True

make_dir = os.environ['HOME'] + "/SHEMAT-Suite"

shem_type = "fw"  # "sm", "fw"
shem_type_name = "fw"  # "sm_sgsim", "fw"
compiler = "ling64"  # "ling64", "lini64"
compiler_name = "64gnu"  # "64gnu","64int"
props = "const"  # "const", "bas", "basc"

# Flags: "omp","debug","noplt","novtk","nohdf"
flags = "omp noplt vtk nohdf -j16"
git_branch = "master-porosity"

# Execution input
is_exec = True

model_name = "TheisProblem"

use_batch_script = True
job_script = "job.sh"

# deltatests_dir
deltatests_dir = shemat_suite_models_dir + "/deltatests"

# model_dir
model_dir = (shemat_suite_models_dir + "/" + shem_type_name + "_" + props + "_"
             + model_name)

# exe_name
exe_name = ("shem_" + shem_type_name + compiler_name + "_" + props + "_" +
            git_branch + ".x")

###############################################################################
#                               Existence checks                              #
###############################################################################
if not os.path.isdir(deltatests_dir):
    raise exceptions.RuntimeError("Directory not found: " + deltatests_dir)
if not os.path.isdir(model_dir):
    raise exceptions.RuntimeError("Directory not found: " + model_dir)
if not os.path.isdir(make_dir):
    raise exceptions.RuntimeError("Directory not found: " + make_dir)

###############################################################################
#                                 Compilation                                 #
###############################################################################
if is_comp:

    # Prepare compilequick.sh
    f = open(deltatests_dir + '/' + 'compilequick.sh', 'r')
    fcontent = f.read()
    f.close()

    fcontentwrite = fcontent.format(
        deltatests_dir_in=deltatests_dir,
        make_dir_in=make_dir,
        shem_type_in=shem_type,
        shem_type_name_in=shem_type_name,
        compiler_in=compiler,
        compiler_name_in=compiler_name,
        props_in=props,
        flags_in=flags,
        git_branch_in=git_branch,
        HOME='{HOME}',
        make_dir='{make_dir}',
        compiler_name='{compiler_name}',
        props='{props}',
        git_branch='{git_branch}',
        shem_type='{shem_type}',
        compiler='{compiler}',
        flags='{flags}',
        shem_type_name='{shem_type_name}',
        new_exe_name='{new_exe_name}',
        deltatests_dir='{deltatests_dir}',
    )

    fnew = open(deltatests_dir + '/' + 'compilequick_run.sh', 'w')
    fnew.write(fcontentwrite)
    fnew.close()

    # Change file permission
    os.chmod(deltatests_dir + '/' + 'compilequick_run.sh', 0770)

    # Run compilequick_run.sh
    comp_out_file = open(deltatests_dir + '/' + 'compilequick.out', 'w')
    rm.run_script(
        deltatests_dir,
        './' + 'compilequick_run.sh',
        outfile=comp_out_file,
        wait=True,
        errout=True)
    comp_out_file.close()

###############################################################################
#                               Existence checks                              #
###############################################################################
if not os.path.isfile(deltatests_dir + "/" + exe_name):
    raise exceptions.RuntimeError("Directory not found: " + deltatests_dir +
                                  "/" + exe_name)
if not os.path.isfile(deltatests_dir + "/" + job_script):
    raise exceptions.RuntimeError("Directory not found: " + deltatests_dir +
                                  "/" + job_script)

###############################################################################
#                                  Execution                                  #
###############################################################################
if is_exec:
    # Copy executable and job_script
    shutil.copyfile(deltatests_dir + "/" + exe_name,
                    model_dir + "/" + exe_name)

    # Change file permission
    os.chmod(model_dir + '/' + exe_name, 0770)

    # Prepare job_script
    if use_batch_script:
        f = open(deltatests_dir + '/' + 'job.sh', 'r')
        fcontent = f.read()
        f.close()

        fcontentwrite = fcontent.format(
            shem_type_name=shem_type_name,
            props=props,
            model_name=model_name,
            exe_name=exe_name)

        fnew = open(model_dir + '/' + 'job.sh', 'w')
        fnew.write(fcontentwrite)
        fnew.close()

    # Run executable
    if use_batch_script:
        rm.run_script(
            model_dir, ['sbatch', job_script],
            outfile=subprocess.PIPE,
            wait=True,
            errout=True)
    else:
        rm.run_script(
            model_dir,
            './' + exe_name,
            outfile=subprocess.PIPE,
            wait=True,
            errout=True)
