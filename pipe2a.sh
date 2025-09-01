#!/bin/bash
# first job - run rplparallel-slurm.sh (không có phụ thuộc)
sbatch /data/src/PyHipp/rplparallel-slurm.sh

# second job - rse-slurm.sh (không có phụ thuộc)
jid2=$(sbatch /data/src/PyHipp/rse-slurm.sh)
#jid2=$(sbatch /data/src/PyHipp/rse-slurm.sh | awk '{print $4}')
# third set of jobs - phụ thuộc vào rse-slurm.sh
jid3=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs1a-slurm.sh)
jid4=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs2a-slurm.sh)
jid5=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs3a-slurm.sh)
jid6=$(sbatch --dependency=afterok:${jid2##* } /data/src/PyHipp/rs4a-slurm.sh)

