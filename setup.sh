#./setup_gc.sh 
#./setup_gctesla.sh
sudo su
./setup_data.sh &
./create_swap.sh &
./setup_dependency.sh #./setup_dependencytesla.sh 
