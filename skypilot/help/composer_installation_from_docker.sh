#!/bin/bash
sky status
ssh cluster-id ## ssh into a cluster
docker pull mosaicml/composer ## pull composer docker
docker run -it --name composer mosaicml/composer:latest ## run composer container, and name it 'composer'
docker restart composer
docker exec -it composer bash
pip3 install --upgrade pip
#git clone https://github.com/mosaicml/llm-foundry.git
# Optional: we highly recommend creating and using a virtual environment
#mkdir venvs
#cd venvs
python -m venv llmfoundry-venv
source llmfoundry-venv/bin/activate
pip install llm-foundry
git clone https://github.com/mosaicml/llm-foundry.git
cd llm-foundry/scripts/train
composer train.py finetune_example/gpt2-arc-easy.yaml
#pip install mosaicml
#cd ../llm-foundry
#pip install -e ".[gpu]"  # or pip install -e . if no NVIDIA GPU
#python
#from composer import Trainer