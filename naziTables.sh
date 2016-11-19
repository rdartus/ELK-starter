#!/bin/bash

IPT="/sbin/iptables"



# Your DNS servers you use: cat /etc/resolv.conf

DNS_SERVER="192.168.1.254"



echo "flush iptable rules"

$IPT -F

$IPT -X

$IPT -t nat -F

$IPT -t nat -X

$IPT -t mangle -F

$IPT -t mangle -X


# DROP EVERYTHING :
echo "Set default policy to 'DROP'"

$IPT -P INPUT   DROP

$IPT -P FORWARD DROP

$IPT -P OUTPUT  DROP
