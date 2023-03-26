#!/bin/bash
set -x
docker rm -f vlan_test1 vlan_test2
docker network rm -f vlan10

# because of this, do not run script itself under sudo:
YOUR_USER=$(whoami)

interface=tap0

sudo ip link set "$interface" down 2>/dev/null
sudo ip link delete "$interface" 2>/dev/null

sudo usermod -a -G netdev "${YOUR_USER}"

sudo ip tuntap add dev "$interface" mode tap user "${YOUR_USER}" group netdev
sudo ip link set "$interface" up

HOST_INTERFACE="$interface" docker compose -f compose.yml up --detach