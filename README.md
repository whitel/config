## 使用方法

+ 使用`install.sh`脚本来安装vim插件以外的内容
+ vim插件的使用：
  + 把`nvim`移动到`~/.config`
  + 把`autoload`移动到`~/.vim`（如果没有就新建一个）
  + 启动vim，输入命令`:PlugInstall`（如果没反应就加个pro）



## 安装一个新的ubuntu

```
apt update && apt install vim git tree zsh proxychains4 curl wget neovim openssh-server pigz pv docker.io
```

```
vim /etc/proxychains.conf
```

```
cd && git clone https://github.com/whitel/config
bash install
cd && mkdir ~/.config && cp ~/config/nvim ~/.config -r
cd && mkdir ~/.vim && cp ~/config/autoload ~/.vim -r
```

```
ssh-keyen
```

```
install ohmyzsh
```

```
install vmware tools
```



## 如何挂载vmware共享文件夹

```
sudo mkdir /mnt/hgfs
sudo vmghfs-fuse -o allow_other .host:/photoprism-data /mnt/hgfs
```

## docker安装后设置

```
sudo usermod -aG docker $USER
curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose
```

## 给docker添加代理

```
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo touch /etc/systemd/system/docker.service.d/proxy.conf
sudo cat > /etc/systemd/system/docker.service.d/proxy.conf << EOF
[Service]
Environment="HTTP_PROXY=http://host:7890/"
Environment="HTTPS_PROXY=http://host:7890/"
Environment="NO_PROXY=localhost,127.0.0.1,.example.com"
EOF

sudo systemctl daemon-reload
sudo systemctl restart docker
```
+ 注意，这里的HTTPS_PROXY后面一定要是http://（而不是https://），否则会出错


## 恢复photoprism
```
wget https://dl.photoprism.app/docker/docker-compose.yml
sed -i 's/- "\.\/storage:\/photoprism\/storage"/- "\~\/photoprism\/storage:\/photoprism\/storage"/g' docker-compose.yml
sed -i 's/- \"\~\/Pictures:\/photoprism\/originals"/- \"\~\/photoprism\/origin:\/photoprism\/originals"/g' docker-compose.yml
```
```
mkdir -p ./storage/backups/mysql
cp photoprism-db.sql ./storage/backups/mysql
docker-compose exec photoprism photoprism restore -i -f
```

## ubuntu & kali登录不打印motd
```
touch ~/.hushlogin
```


