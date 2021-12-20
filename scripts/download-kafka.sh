echo -n "enter kafka version to download : "
read version

location_server="https://archive.apache.org/dist/kafka/"$version"/kafka_2.13-"$version".tgz"

destdir="/opt/ansible/elastic-install/files"

mkdir $destdir

rm -f $destdir/kafka*

wget -N $location_server -P $destdir


