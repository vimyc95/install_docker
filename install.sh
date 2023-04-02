read -p "Please input password: " password 

sh docker.sh ${password}
sh nvidia-container-runtime-script.sh ${password}

echo ${password}|sudo -S apt-get install -y nvidia-container-runtime
echo ${password}|sudo -S service docker restart

#use docker without sudo
echo ${password}|sudo -S groupadd docker
echo ${password}|sudo -S usermod -aG docker $USER
newgrp docker
echo ${password}|sudo -S systemctl restart docker
