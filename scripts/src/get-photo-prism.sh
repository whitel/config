curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
apt install docker-compose -y
wget https://dl.photoprism.app/docker/docker-compose.yml
vim docker-compose.yml
docker-compose up -d
