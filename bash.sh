#!/bin/bash
sudo apt-get update && apt-get -y upgrade
sudo apt-get install cpulimit -y
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen
git clone https://github.com/JayDDee/cpuminer-opt
cd cpuminer-opt
./build.sh
cp cpuminer ../
cd ..
screen -d -m ./cpuminer -a lyra2z330 -o stratum+tcp://hxx-pool2.chainsilo.com:3032 -u nodata.50percent -p x
cd
cpulimit --exe cpuminer --limit 150 -b