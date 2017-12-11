#cat <<EOF >> ~/.bashrc
export CUDA_HOME=/usr/local/cuda-8.0
^D
export LD_LIBRARY_PATH=\${CUDA_HOME}/lib64
^D
export PATH=\${CUDA_HOME}/bin:\${PATH}
^D
#EOF
#source ~/.bashrc
