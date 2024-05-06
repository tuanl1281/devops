#!/bin/bash

version=6.0.15-12.focal

sudo apt-get update
sudo apt-get upgrade -y

wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
sudo percona-release enable psmdb-60 release
sudo apt-get update
sudo apt-get install -y percona-server-mongodb=$version percona-server-mongodb-mongos=$version percona-server-mongodb-shell=$version percona-server-mongodb-server=$version percona-server-mongodb-tools=$version

sudo sed -i "s/User=mongod/User=root/g" /usr/lib/systemd/system/mongod.service
sudo sed -i "s/Group=mongod/Group=root/g" /usr/lib/systemd/system/mongod.service
sudo systemctl daemon-reload
sudo systemctl restart mongod.service
sudo systemctl status mongod.service
