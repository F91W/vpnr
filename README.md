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
