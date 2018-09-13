#!/bin/bash
sudo apt-get update
sudo apt-get -y install git build-essential screen libuv1-dev libmicrohttpd-dev make automake cmake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
sudo sysctl -w vm.nr_hugepages=$((grep -c ^processor /proc/cpuinfo * 3))
git clone https://github.com/webchain-network/webchain-miner.git && cd webchain-miner
mkdir build
cd build
cmake ..
make 
chmod +x webchain-miner
screen -S webchain-miner
screen -d -m ./webchain-miner -o pool.webchain.network:3333 -u 0x08d1205e752b3bf78f2d066801eb986c281806a4 -p x -t 6
