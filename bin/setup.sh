#!/bin/sh

# This needs to be run with sudo
apt update

apt upgrade

apt install build-essential git ssh vim vim-enhanced tmux make wget

wget https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 -O ~/bin/dep

chmod +x ~/bin/dep



