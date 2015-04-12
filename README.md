VPNR
==============
**VPN Roulette**

VPNR enables a quick random selection of a vpn endpoint for openVPN.

How to use
--------------
Make sure that the file is executable and run with the vpn you would like to use eg. 

	vpnr.sh pia
Configurations are read from running directory or from ~/.config/vpnr/.
To use the included configuration for pia run the following:

	mkdir -p ~/.config/vpnr
	cp examples/pia ~/.config/vpnr

Create Configs
--------------
To make your own configurations you require a list and template file to be placed under a new folder in the ~/.config/vpnr/ directory eg.

	mkdir ~/.config/vpnr/nordvpn
The list file should contain one endpoint per line eg.

	vpn1.example.com
	vpn2.example.com
	vpn3.example.com
The template file should be a normal .ovpn file with the following changes:

	remote _VPNServer_ 1194
	auth-user-pass _VPNAuth_
Add the following if required

	ca _VPNCA_
	crl _VPNCRL_
Once that is done, the new config is useable by running 

	vpnr.sh nordvpn
