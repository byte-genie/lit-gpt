resources:
  accelerators: V100:1  # 1x NVIDIA V100 GPU

num_nodes: 1  # Number of VMs to launch

# Working directory (optional) containing the project codebase.
# Its contents are synced to ~/sky_workdir/ on the cluster.
workdir: .

# Commands to be run before executing the job.
# Typical use: pip install -r requirements.txt, git clone, etc.
setup: |
  sudo apt update
  sudo apt upgrade
  python3 -m venv falcon-venv
  source falcon-venv/bin/activate
  python3 -m pip install --upgrade pip
  pip install huggingface_hub
  python scripts/download.py --repo_id tiiuae/falcon-7b
  python scripts/convert_hf_checkpoint.py --checkpoint_dir checkpoints/tiiuae/falcon-7b
  pip install --index-url https://download.pytorch.org/whl/nightly/cu118 --pre 'torch>=2.1.0dev'
  pip install -r requirements.txt

# Commands to run as a job.
# Typical use: launch the main program.
run: |
  python scripts/prepare_alpaca.py
  python finetune/adapter_v2.py