#!/bin/sh

if [ ! -d /usr/local/go ] ;then
    case ${OSTYPE} in
        darwin*)
            wget https: / storage.googleapis.com/golang/go1.10.3.darwin-amd64.tar.gz
            sudo tar -xvf go1.10.3.darwin-amd64.tar.gz
            ;;
        linux*)
            wget https: / storage.googleapis.com/golang/go1.10.3.linux-amd64.tar.gz
            sudo tar -xvf go1.10.3.linux-amd64.tar.gz
            ;;
    esac
    sudo mv -f go /usr/local
fi
export PATH=/usr/local/go/bin:$PATH
go get -u github.com/motemen/ghq
go get -u github.com/peco/peco/cmd/peco
go get -u github.com/variadico/noti/cmd/noti
go get -u github.com/kurehajime/pera
