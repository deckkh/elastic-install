echo -n "enter easyrsa version to download : "
read version

location_server="https://github.com/OpenVPN/easy-rsa/releases/download/v"$version"/EasyRSA-"$version".tgz"

destdir="/opt/ansible/elastic-install/files"

mkdir $destdir

rm -f $destdir/easyrsa*.tgz

wget -N $location_server -P $destdir


