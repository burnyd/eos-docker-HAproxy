#!/usr/bin/env bash

sleep 5

sudo su

#Check for ping connectivity to google before proceeding.

ping -q -c5 google.com > /dev/null
 
if [ $? -eq 0 ]
then
	echo "connectivity is there"
else    echo "connectivity is not there"
        exit 1 
fi 

echo "Add dns names to etc hosts"
echo 10.0.0.99 leaf1a  >> /etc/hosts
echo 10.0.0.100 leaf1b  >> /etc/hosts
echo 10.0.0.101 spine1  >> /etc/hosts
echo 10.0.0.102 spine2  >> /etc/hosts
echo 10.0.0.103 leaf2a  >> /etc/hosts
echo 10.0.0.103 leaf2b  >> /etc/hosts

echo "Updating packages"
apt-get update -y
apt-get install python-pip -y

pip install flask 

sudo su
ifconfig eth1 10.0.5.6 netmask 255.255.255.0
ip route add 10.0.0.0/8 via 10.0.5.1
ip route add 192.168.0.0/16 via 10.0.5.1 

python /vagrant/scripts/testapp.py &

