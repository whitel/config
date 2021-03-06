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
		mv ~/.ssh/config ~/.ssh/.config.backup
	fi
	if [[ -f ~/.zshrc ]]; then
		mv ~/.zshrc ~/.zshrc.backup
	fi
	if [[ -f ~/.shell_local ]]; then
		mv ~/.shell_local ~/.shell_local.backup
	fi
	if [[ -f ~/.scripts ]]; then
		mv ~/.scripts ~/.scripts.backup
	fi
	echo "[v] Original files were moved to ~/.*.backup"

	echo "[v] Installing .vimrc .bashrc .gitconfig..."
	ln -s ~/config/vimrc ~/.vimrc
	ln -s ~/config/bashrc ~/.bashrc
    cp ~/config/gitconfig ~/.gitconfig
	cp ~/config/sshconfig ~/.ssh/config
	ln -s ~/config/shell_local ~/.shell_local
	ln -s ~/config/zshrc ~/.zshrc
    ln -s ~/config/scripts ~/.scripts
else
	echo "[x] unknown command" \"$option\"
	echo ""
	echo "Usage: "
	echo "    bash $0 [vim|pass]"
	exit 1
fi

echo "[v] Done."

