#!/bin/sh

# This needs to be run with sudo
apt update

apt upgrade

apt install build-essential git ssh vim vim-enhanced tmux make wget zip

wget https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 -O ~/bin/dep
chmod +x ~/bin/dep

wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz -O ~/go-linux.tar.gz
tar xzf ~/go-linux.tar.gz -C ~/
ln -s ~/go/bin/go ~/bin/go
ln -s ~/go/bin/godoc ~/bin/godoc
ln -s ~/go/bin/gofmt ~/bin/gofmt
