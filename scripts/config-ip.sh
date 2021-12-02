#
interface="eth0"
vlan="192.168.0."
gateway="1"
mask="24"
echo -n "enter last octet : "
read last_octet
echo -n "enter hostname : "
read hostname
#nmcli con show $interface
nmcli con mod $interface ipv4.dns 8.8.8.8
nmcli con mod $interface +ipv4.dns 8.8.4.4
nmcli con mod $interface ipv4.gateway $vlan$gateway
nmcli con mod $interface ipv4.addresses $vlan$last_octet/$mask
nmcli general hostname $hostname
nmcli con up $interface