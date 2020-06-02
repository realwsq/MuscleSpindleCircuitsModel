import os
import sys
print(os.name)
print(sys.version_info[0])
if os.name == 'posix' and sys.version_info[0] < 3:
    import subprocess32 as subprocess
else:
    import subprocess

print('before running subprocess')
rc = subprocess.check_call('srun -n 1 --mpi=pmi2 nrniv -python -u /users/swang189/formentoModel/MuscleSpindleCircuitsModel/neuralnetwork/code/hello_world.py',shell=True)
#rc = subprocess.check_call('srun -n 1 --mpi=pmi2 nrniv -python -u /users/swang189/formentoModel/MuscleSpindleCircuitsModel/neuralnetwork/code/hello_world.py',shell=True)
#rc = subprocess.check_call('srun -n $SLURM_NTASKS --mpi=pmi2 nrniv -python -u /users/swang189/formentoModel/MuscleSpindleCircuitsModel/neuralnetwork/code/hello_world.py',shell=True)
print(rc)
