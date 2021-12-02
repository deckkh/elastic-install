#
nmcli con show "eth0"
nmcli con mod "eth0" ipv4.dns 8.8.8.8
nmcli con mod "eth0" +ipv4.dns 8.8.4.4
nmcli con mod "eth0" ipv4.gateway 192.168.0.1
nmcli con mod "eth0" ipv4.ipaddresses 192.168.0.2/24
nmcli con up eth0