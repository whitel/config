# /bin/bash

option=$1
cd ~/config

if [[ $option == "" ]]; then
	echo "[v] Installing .vimrc .bashrc .gitconfig..."
	cp vimrc ~/.vimrc
	# cp bashrc ~/.bashrc
	cp gitconfig ~/.gitconfig
elif [[ $option == "vim" ]]; then
	echo "[v] Install vim..."
	if [[ -d ~/.vim ]]; then
		mv ~/.vim ~/.vim.backup
	fi
	cp -r vim ~/.vim
	echo "[x] the funcion is not implemented, please manually install vim plugins."
elif [[ $option == "pass" ]]; then
	echo "[v] Install password..."
	cp Passwords.kdbx $chome
else
	echo "[x] unknown command" \"$option\"
	echo ""
	echo "Usage: "
	echo "    bash $0 [vim|pass]"
	exit 1
fi

echo "[v] Done."

