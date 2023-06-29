#!/bin/bash
wget https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo add-apt-repository contrib
sudo apt-get update
sudo apt-get -y install cuda
## install from run file
#wget https://developer.download.nvidia.com/compute/cuda/11.3.0/local_installers/cuda_11.3.0_465.19.01_linux.run
wget wget https://developer.download.nvidia.com/compute/cuda/12.2.0/local_installers/cuda_12.2.0_535.54.03_linux.run
chmod +x cuda_12.2.0_535.54.03_linux.run
#sudo cuda_12.2.0_535.54.03_linux.run
sudo ./cuda_12.2.0_535.54.03_linux.run --silent --toolkit-accept
export PATH=/usr/local/cuda-12.2/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64:$LD_LIBRARY_PATH

