#!/bin/sh

sleep 5

FastCli -p 15 -c "configure
hostname leaf1a
!
username api secret password
!
username vagrant secret vagrant
!
event-handler Terminattr
   trigger on-boot
   action bash /usr/bin/TerminAttr -grpcaddr 0.0.0.0:6042 -allowed_ips 0.0.0.0/0 -disableaaa
!
ip name-server vrf default 8.8.8.8
ip domain-list 8.8.8.8
!
vlan 5
!
interface vlan 5
ip address 10.0.5.2/24
vrrp 5 ip 10.0.5.1
no shut
!
interface Ethernet1
  no switchport
  ip address 10.0.0.99/24
!
interface Ethernet2
description connection-to-spine1
no switchport
ip address 10.0.11.2/24
!
interface Ethernet3
description connection-to-spine2
no switchport
ip address 10.0.12.2/24
!
interface Ethernet4
description connection-to-leaf1b
switchport
switchport mode trunk
!
interface Ethernet5
description connection-to-host1
switchport mode access
switchport access vlan 5
!
interface Ethernet6
description connection-to-host2
switchport mode access
switchport access vlan 5
!
int loopback0
ip address 1.1.1.1/32
!
ip routing
!
ip route 0.0.0.0/0 10.0.2.2
!
management api http-commands
   protocol http
   no shutdown
!
management api gnmi
transport grpc default
port 6030
no ssl profile
no shutdown
!
exit"
