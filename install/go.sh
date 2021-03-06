#!/bin/sh

if [ ! -d /usr/local/go ] ;then
    case ${OSTYPE} in
        darwin*)
            wget https: / storage.googleapis.com/golang/go1.14.6.darwin-amd64.tar.gz
            sudo tar -xvf go1.14.6.darwin-amd64.tar.gz
            ;;
        linux*)
            wget https: / storage.googleapis.com/golang/go1.14.6.linux-amd64.tar.gz
            sudo tar -xvf go1.14.6.linux-amd64.tar.gz
            ;;
    esac
    sudo mv -f go /usr/local
fi
export PATH=/usr/local/go/bin:$PATH
#go get -u github.com/peco/peco/cmd/peco
#go get -u github.com/variadico/noti/cmd/noti
#go get -u github.com/kurehajime/pera
#go get -u github.com/mattn/memo
