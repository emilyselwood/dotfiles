#!/bin/sh

# This needs to be run with sudo
add-apt-repository ppa:webupd8team/java
apt update
apt upgrade -y
apt install -y build-essential git ssh vim tmux make wget zip python3 python3-pip oracle-java8-installer

pip3 install --upgrade pip

mkdir -p ~/bin

wget https://github.com/golang/dep/releases/download/v0.4.1/dep-linux-amd64 -O ~/bin/dep
chmod +x ~/bin/dep

wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz -O ~/go-linux.tar.gz
tar xzf ~/go-linux.tar.gz -C ~/
ln -s ~/go/bin/go ~/bin/go
ln -s ~/go/bin/godoc ~/bin/godoc
ln -s ~/go/bin/gofmt ~/bin/gofmt

cp ../.* ~/

ln -s /mnt/c/git /git
ln -s /mnt/c/data /data

## symlink chrome so xdg-open can work
ln -s /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe /usr/bin/chrome
