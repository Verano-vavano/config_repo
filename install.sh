#!/bin/bash

if [ -d ~/.vim ]; then
	rm -rf ~/.vim
fi
ln -sv `pwd`/.vim ~
ln -bfisv `pwd`/.vim/.vimrc ~
ln -bfisv `pwd`/.zshrc ~
if [ ! -d ~/.config/zellij ]; then
	mkdir -p ~/.config/zellij
fi
ln -bfisv `pwd`/config.kdl ~/.config/zellij
