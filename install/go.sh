#!/bin/sh

if [ ! -d /usr/local/go ] ;then
    wget https: / storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
    sudo tar -xvf go1.9.2.linux-amd64.tar.gz
    sudo mv -f go /usr/local
fi
export PATH=/usr/local/go/bin:$PATH
go get -u github.com/motemen/ghq
go get -u github.com/peco/peco/cmd/peco
go get -u github.com/variadico/noti/cmd/noti
go get -u github.com/kurehajime/pera
