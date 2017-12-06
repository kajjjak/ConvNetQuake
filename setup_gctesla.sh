curl -O https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install -y cuda-8-0
cat <<EOF >> ~/.bashrc
export CUDA_HOME=/usr/local/cuda-8.0
export LD_LIBRARY_PATH=\${CUDA_HOME}/lib64
export PATH=\${CUDA_HOME}/bin:\${PATH}
EOF
source ~/.bashrc
#cuda-install-samples-8.0.sh ~
#cd ~/NVIDIA_CUDA-8.0_Samples/1_Utilities/deviceQuery
#make
#./deviceQuery
#cd ~
wget https://storage.googleapis.com/convnetquake/cudnn-8.0-linux-x64-v6.0.tgz
tar xvzf cudnn-8.0-linux-x64-v6.0.tgz
sudo cp -P cuda/include/cudnn.h $CUDA_HOME/include
sudo cp -P cuda/lib64/libcudnn* $CUDA_HOME/lib64
sudo chmod u+w $CUDA_HOME/include/cudnn.h
sudo chmod a+r $CUDA_HOME/lib64/libcudnn
export LC_ALL=C
sudo apt-get install python-dev python-pip libcupti-dev
sudo pip install tensorflow-gpu
