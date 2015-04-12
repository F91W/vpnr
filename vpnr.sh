#!/bin/bash

if [ -d "$1" ]; then
	VPN=$1
else
	VPN=~/.config/vpnr/$1
fi

VPNList=$VPN/list
VPNTemplate=$VPN/template
VPNServer=$(shuf -n 1 $VPNList)
if [ -f "$VPN/auth" ]; then
	VPNAuth=$(readlink -f $VPN/auth)
else
	VPNAuth=""
fi
if [ -f "$VPN/ca" ]; then
	VPNCA=$(readlink -f $VPN/ca)
else
	VPNCA=""
fi
if [ -f "$VPN/crl" ]; then
	VPNCRL=$(readlink -f $VPN/crl)
else
	VPNCRL=""
fi

sed -e s/_VPNServer_/$VPNServer/g -e s#_VPNAuth_#$VPNAuth#g -e s#_VPNCA_#$VPNCA#g -es#_VPNCRL_#$VPNCRL#g $VPNTemplate > /tmp/vpnr.ovpn
echo "Server: "$VPNServer

sudo openvpn /tmp/vpnr.ovpn 
