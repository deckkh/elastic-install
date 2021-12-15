
location_server="https://dl.min.io/server/minio/release/linux-amd64"
location_client="https://dl.min.io/client/mc/release/linux-amd64"

destdir="/opt/ansible/elastic-install/files"

mkdir $destdir

rm -f $destdir/minio
rm -f $destdir/mc

wget -N $location_server/minio -P $destdir
wget -N $location_client/mc -P $destdir


