#!/bin/bash

#configure network
rm /etc/network/interfaces
echo auto lo > /etc/network/interfaces
echo iface lo inet loopback >> /etc/network/interfaces
echo >> /etc/network/interfaces
echo auto $1 >> /etc/network/interfaces
echo iface $1 inet static >> /etc/network/interfaces
echo address $2 >> /etc/network/interfaces
echo netmask $3 >> /etc/network/interfaces
echo gateway $4 >> /etc/network/interfaces
echo dns-nameservers $5 >> /etc/network/interfaces

#configure DNS
rm /etc/resolv.conf
echo nameserver $5 >> /etc/resolv.conf

#Restart networking to take
systemctl restart networking