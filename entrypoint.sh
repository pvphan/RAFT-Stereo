#!/bin/bash --login
# The --login ensures the bash configuration is loaded,
# enabling Conda.

# Enable strict mode.
set -euo pipefail
# ... Run whatever commands ...

# Temporarily disable strict mode and activate conda:
set +euo pipefail
source ~/.bashrc
conda activate raftstereo

# Re-enable strict mode:
set -euo pipefail

bash
#exec python demo.py --restore_ckpt models/raftstereo-middlebury.pth --corr_implementation alt --mixed_precision -l=datasets/Middlebury/MiddEval3/testF/*/im0.png -r=datasets/Middlebury/MiddEval3/testF/*/im1.png
