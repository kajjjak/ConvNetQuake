# https://www.digitalocean.com/community/tutorials/how-to-configure-virtual-memory-swap-file-on-a-vps
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=8000k count=1000
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
