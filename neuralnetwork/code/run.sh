#!/bin/bash

# Request an hour of runtime:
#SBATCH --time=5:00
# ingle core
#SBATCH -c 1
#SBATCH --account=carney-tserre-condo
#SBATCH -J mpi4py_test
#SBATCH -o mpi4py_test.out
#SBATCH -e mpi4py_test.err
#SBATCH --array=2
#SBATCH -t 30
#SBATCH --mem-per-cpu=4000
module load anaconda/3-5.2.0
module load mpi
module load neuron
#srun -n $SLURM_NTASKS --mpi=pmi2 nrniv -python hello_world.py
#srrun -n 1 python -u sub.py
#python -u  sub.py
NSIMS=2
for kinIdx in $( seq $SLURM_ARRAY_TASK_ID $SLURM_ARRAY_TASK_COUNT $NSIMS )
  do
  echo "Kinematics Set: $kinIdx"
  python -u  sub.py  
# python -u "/gpfs_home/rdarie/Github/epflModelInterface/mscmi/scripts/run_synthetic.py" human 16 $kinIdx
done
