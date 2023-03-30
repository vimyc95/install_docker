sh docker.sh
sh nvidia-container-runtime-script.sh

sudo apt-get install -y nvidia-container-runtime
sudo service docker restart

#use docker without sudo
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl restart docker
