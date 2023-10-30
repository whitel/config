## 使用方法

+ 使用`install.sh`脚本来安装vim插件以外的内容
+ vim插件的使用：
  + 把`nvim`移动到`~/config`
  + 把`autoload`移动到`~/.vim`（如果没有就新建一个）
  + 启动vim，输入命令`:PlugInstall`（如果没反应就加个pro）



## 安装一个新的ubuntu

```
apt update && apt install vim git tree zsh proxychains4 curl wget neovim openssh-server
```

```
vim /etc/proxychains.conf
```

```
cd && git clone https://github.com/whitel/config
bash install
cd && cp ~/config/nvim -r
cd && mkdir ~/.vim && cp ~/config/autoload .vim -r
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

