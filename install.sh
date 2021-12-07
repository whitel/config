# /bin/bash

option=$1
cd ~/config

if [[ $option == "" ]]; then
	if [[ -f ~/.vimrc ]]; then
		mv ~/.vimrc ~/.vimrc.backup
	fi
	if [[ -f ~/.bashrc ]]; then
		mv ~/.bashrc ~/.bashrc.backup
	fi
	if [[ -f ~/.gitconfig ]]; then
		mv ~/.gitconfig ~/.gitconfig.backup
	fi
	if [[ -f ~/.ssh/config ]]; then
		mv ~/.ssh/config ~/.ssh/.config
	fi
	echo "[v] Original files were moved to ~/.*.backup"

	echo "[v] Installing .vimrc .bashrc .gitconfig..."
	ln -s ~/config/vimrc ~/.vimrc
	ln -s ~/config/bashrc ~/.bashrc
	ln -s ~/config/gitconfig ~/.gitconfig
	ln -s ~/config/sshconfig ~/.ssh/config
else
	echo "[x] unknown command" \"$option\"
	echo ""
	echo "Usage: "
	echo "    bash $0 [vim|pass]"
	exit 1
fi

echo "[v] Done."

