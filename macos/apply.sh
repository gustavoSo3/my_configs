#!/bin/sh

echo "Exporting scripts"
export export PATH=~/.my_configs/scripts:$PATH

# Common
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

# Custom
echo "Linking .zshenv"
if [ -f ~/.zshenv ]; then
	if [ ! -d ~/.old ]; then
		mkdir ~/.old
	fi
	mv ~/.zshenv ~/.old
fi
ln -s ~/.my_configs/macos/.zshenv ~/.zshenv

echo "Linking .zshrc"
if [ -f ~/.zshrc ]; then
	if [ ! -d ~/.old ]; then
		mkdir ~/.old
	fi
	mv ~/.zshrc ~/.old
fi
ln -s ~/.my_configs/macos/.zshrc ~/.zshrc

echo "Linking complete. Run: source ~/.zshrc; to finish"

