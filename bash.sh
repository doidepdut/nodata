#!/bin/bash
sudo apt-get update
sudo apt-get -y install git build-essential screen libuv1-dev libmicrohttpd-dev make automake cmake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev
sudo sysctl -w vm.nr_hugepages=$((grep -c ^processor /proc/cpuinfo * 3))
git clone https://github.com/xmrig/xmrig.git
mkdir build
cd build
cmake ..
make 
chmod +x xmrig
screen -S trtl-miner
screen -d -m ./xmrig --donate-level 1 -o turtlecoin.herominers.com:10382 -u TRTLv1mkg7FA3BhE8f1JVaWVGe481NvBSYCs2nu8oxVRSpm3WFewcNy6LDXJob17t2gTvgE2EgUat4QbPobFCQ5DVYmhUHs6fiy -p screen -a chukwa -k -t 100
