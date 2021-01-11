apt update
apt install vim tmux python3-dev python3-venv python3-pip
python3 -m pip install --upgrade pip setuptools
python3 -m pip install wheel

cd ~/cuda_11

# Install CUDA Toolkit 11.0 Update 1
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb
dpkg -i cuda-repo-ubuntu2004-11-0-local_11.0.3-450.51.06-1_amd64.deb
apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub
apt-get update
apt-get -y install cuda

# Environment setup
echo "export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc

# Install cuDNN v8.0.5 for CUDA 11.0
tar -xzvf cudnn-11.0-linux-x64-v8.0.5.39.tgz
cp cuda/include/cudnn*.h /usr/local/cuda/include
cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

python3 -m pip install tensorflow-gpu transformers pandas scikit-learn

echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
echo "export LANG=en_US.UTF-8" >> ~/.bashrc
echo "export LANGUAGE=en_US.UTF-8" >> ~/.bashrc
source ~/.bashrc
