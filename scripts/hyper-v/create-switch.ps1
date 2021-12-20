$name = "nat-switch"
$net = "192.168.0"
$gateway = "192.168.0.1"
$prefix = 24

# read docs at https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/setup-nat-network

New-VMSwitch -SwitchName $name -SwitchType Internal
$adapter = get-netadapter -name "vEthernet ($name)"
New-NetIPAddress -IPAddress $gateway -PrefixLength $prefix -InterfaceIndex $adapter.ifIndex
New-NetNat -Name MyNATnetwork -InternalIPInterfaceAddressPrefix "$net.0/$prefix"