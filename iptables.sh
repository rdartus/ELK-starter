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



echo "Set default policy to 'DROP'"

$IPT -P INPUT   DROP

$IPT -P FORWARD DROP

$IPT -P OUTPUT  DROP



## This should be one of the first rules.

## so dns lookups are already allowed for your other rules

for ip in $DNS_SERVER

do

	echo "Allowing DNS lookups (tcp, udp port 53) to server '$ip'"

	$IPT -A OUTPUT -p udp -d $ip --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

	$IPT -A INPUT  -p udp -s $ip --sport 53 -m state --state ESTABLISHED     -j ACCEPT

	$IPT -A OUTPUT -p tcp -d $ip --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

	$IPT -A INPUT  -p tcp -s $ip --sport 53 -m state --state ESTABLISHED     -j ACCEPT

done



echo "allow all and everything on localhost"

$IPT -A INPUT -i lo -j ACCEPT

$IPT -A OUTPUT -o lo -j ACCEPT





#######################################################################################################

## Global iptable rules. Not IP specific



echo "Allowing new and established incoming connections to port 80, 443"

#$IPT -A INPUT  -p tcp -m multiport --dports 80,443 -j ACCEPT

#$IPT -A OUTPUT -p tcp -m multiport --sports 80,443 -j ACCEPT



$IPT -A INPUT -p tcp --dport 80 -j ACCEPT

$IPT -A INPUT -p tcp --dport 443 -j ACCEPT



$IPT -A INPUT -p tcp --sport 80 -j ACCEPT

$IPT -A INPUT -p tcp --sport 443 -j ACCEPT



$IPT -A OUTPUT -p tcp --dport 80 -j ACCEPT

$IPT -A OUTPUT -p tcp --dport 443 -j ACCEPT



echo "Allow all outgoing connections to port 22"

$IPT -A OUTPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPT -A INPUT  -p tcp --sport 22 -m state --state ESTABLISHED     -j ACCEPT



echo "Allow outgoing icmp connections (pings,...)"

$IPT -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

$IPT -A INPUT  -p icmp -m state --state ESTABLISHED,RELATED     -j ACCEPT



echo "Allow outgoing connections to port 123 (ntp syncs)"

$IPT -A OUTPUT -p udp --dport 123 -m state --state NEW,ESTABLISHED -j ACCEPT

$IPT -A INPUT  -p udp --sport 123 -m state --state ESTABLISHED     -j ACCEPT



# Log before dropping

$IPT -A INPUT  -j LOG  -m limit --limit 12/min --log-level 4 --log-prefix 'IP INPUT drop: '

$IPT -A INPUT  -j DROP



$IPT -A OUTPUT -j LOG  -m limit --limit 12/min --log-level 4 --log-prefix 'IP OUTPUT drop: '

$IPT -A OUTPUT -j DROP