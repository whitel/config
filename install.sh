# /bin/bash

option=$1
cd ~/config

if [[ $option == "" ]]; then
	echo "[v] Installing .vimrc .bashrc .gitconfig..."
	cp vimrc ~/.vimrc
	cp bashrc ~/.bashrc
	cp gitconfig ~/.gitconfig
else
	echo "[x] unknown command" \"$option\"
	echo ""
	echo "Usage: "
	echo "    bash $0 [vim|pass]"
	exit 1
fi

echo "[v] Done."

