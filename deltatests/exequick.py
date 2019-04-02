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

shem_type_name = "fw"  # "sm", "fw"
compiler_name = "64gnu"  # "64gnu","64int"
props = "const"
model_name = "TheisProblem"

git_branch = "master-porosity"

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

if not os.path.isfile(deltatests_dir + "/" + exe_name):
    raise exceptions.RuntimeError("Directory not found: " + deltatests_dir +
                                  "/" + exe_name)
if not os.path.isfile(deltatests_dir + "/" + job_script):
    raise exceptions.RuntimeError("Directory not found: " + deltatests_dir +
                                  "/" + job_script)

###############################################################################
#                                   Actions                                   #
###############################################################################
# Copy executable and job_script
shutil.copyfile(deltatests_dir + "/" + exe_name, model_dir + "/" + exe_name)

# Change file permission
os.chmod(model_dir + '/' + exe_name, 0660)

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
    rm.run_script(model_dir, ['sbatch', job_script], outfile=subprocess.PIPE)
else:
    rm.run_script(model_dir, './' + exe_name)
