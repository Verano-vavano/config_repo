#!/bin/bash

ln -s .vim ~
ln -s .vim/.vimrc ~
ln -s .zshrc ~
if [ ! -d ~/.config/zellij ]; then
	mkdir -p ~/.config/zellij
fi
ln -s config.kdl ~/config/zellij
