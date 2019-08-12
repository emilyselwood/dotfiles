#!/bin/sh

# This needs to be run with sudo

apt update
apt upgrade -y

apt install dos2unix

dos2unix ../pkglist.txt

## Install from package list. 
apt install -y $(cat ../pkglist.txt)

## Update pip 
pip3 install --upgrade pip
## TODO: install more pip bits

## bin dir in home folder which ends up on the path. 
mkdir -p ~/bin

## Install dep
dep_url=$(curl --silent "https://api.github.com/repos/golang/dep/releases/latest" | jq -r '.assets[] | select(.name | endswith("linux-amd64")).browser_download_url')
wget "$dep_url" -O ~/bin/dep
chmod +x ~/bin/dep

## Install go
go_url=$(curl --silent "https://golang.org/dl/" | hxnormalize -x | hxselect -s '\n' -i 'a.downloadBox' | grep linux-amd64 | grep -Po 'http[^\"]+')
wget "$go_url" -O ~/go-linux.tar.gz
tar xzf ~/go-linux.tar.gz -C ~/
ln -s ~/go/bin/go ~/bin/go
ln -s ~/go/bin/godoc ~/bin/godoc
ln -s ~/go/bin/gofmt ~/bin/gofmt

cp ../.* ~/

ln -s /mnt/c/git /git
ln -s /mnt/c/data /data

## symlink in docker
# Much easier than faffing around forwarding pipes through things.
ln -s "/mnt/c/Program Files/Docker/Docker/resources/bin/docker.exe" ~/bin/docker

## symlink chrome so xdg-open can work
ln -s /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe /usr/bin/chrome

## Symlink m2 folders
ln -s /mnt/c/Users/Wil.Selwood/.m2/ ~/.m2
