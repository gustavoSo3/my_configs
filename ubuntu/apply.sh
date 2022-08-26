#!/bin/sh

echo "Linking .vimrc"
if [ -f ~/.vimrc ]; then
	if [ ! -d ~/.old ]; then
		mkdir ~/.old
	fi
	mv ~/.vimrc ~/.old
fi
ln -s ~/.my_configs/common/.vimrc ~/.vimrc
echo "Linking .gitcongif"
if [ -f ~/.gitconfig ]; then
	if [ ! -d ~/.old ]; then
		mkdir ~/.old
	fi
	mv ~/.gitconfig ~/.old
fi
ln -s ~/.my_configs/common/.gitconfig ~/.gitconfig
echo "Linking .bash_aliases"
if [ -f ~/.bash_aliases ]; then
	if [ ! -d ~/.old ]; then
		mkdir ~/.old
	fi
	mv ~/.bash_aliases ~/.old
fi
ln -s ~/.my_configs/ubuntu/.bash_aliases ~/.bash_aliases
echo "Linking .bashrc"
if [ -f ~/.bashrc ]; then
	if [ ! -d ~/.old ]; then
		mkdir ~/.old
	fi
	mv ~/.bashrc ~/.old
fi
ln -s ~/.my_configs/ubuntu/.bashrc ~/.bashrc

echo "Linking complete. Run: source ~/.bashrc; to finish"

