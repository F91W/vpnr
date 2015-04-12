#!/bin/bash

VPN=$1

VPNList=$VPN/list
VPNAuth=$(readlink -f $VPN/auth)
VPNCA=$(readlink -f $VPN/ca)
VPNCRL=$(readlink -f $VPN/crl)
VPNTemplate=$VPN/template

VPNServer=$(shuf -n 1 $VPNList)

sed -e s/_VPNServer_/$VPNServer/g -e s#_VPNAuth_#$VPNAuth#g -e s#_VPNCA_#$VPNCA#g -es#_VPNCRL_#$VPNCRL#g $VPNTemplate
