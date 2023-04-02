echo $1|sudo -S apt-get update
echo $1|sudo -S apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo $1|sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg
echo $1|sudo -S gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo $1|sudo -S chmod a+r /etc/apt/keyrings/docker.gpg
echo $1|sudo -S apt-get update
echo $1|sudo -S apt-get -y install docker-ce docker-ce-cli containerd.io