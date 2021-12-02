#
interface="eth0"
echo -n "enter last octet : "
read last_octet
nmcli con show $interface
nmcli con mod $interface ipv4.dns 8.8.8.8
nmcli con mod $interface +ipv4.dns 8.8.4.4
nmcli con mod $interface ipv4.gateway 192.168.0.$last_octet
nmcli con mod $interface ipv4.ipaddresses 192.168.0.2/24
nmcli con up eth0