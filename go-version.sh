#!/bin/bash

platform=$(uname -s | awk '{ print tolower($1) }')

#install golang

echo "install golang "

echo "clean golang"

sudo rm -rf /usr/local/go

version=${1:-$1}
name="go${version}.${platform}-amd64.tar.gz"
curl -L https://dl.google.com/go/$name -o /tmp/$name
sudo tar xzf /tmp/$name -C /usr/local && rm /tmp/$name
