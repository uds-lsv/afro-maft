#!/bin/bash

# make sure only first task per node installs stuff, others wait
DONEFILE="/tmp/install_done_${SLURM_JOBID}"
if [[ $SLURM_LOCALID == 0 ]]; then
  
  # put your install commands here:
  # conda install -c python=3.8
  # cd /netscratch/alabi/data/anaconda3/bin
  # source activate
  # cd /netscratch/alabi/data/Lafand/enyo/lafand-mt 
  pip install -r requirements.txt
  pip install seqeval==1.2.2
  pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
  
  # Tell other tasks we are done installing
  touch "${DONEFILE}"
else
  # Wait until packages are installed
  while [[ ! -f "${DONEFILE}" ]]; do sleep 1; done
fi
