echo -n "enter minio version to download : "
read version

location_server="https://dl.min.io/server/minio/release/linux-amd64"
location_client="https://dl.min.io/client/mc/release/linux-amd64"

destdir="/opt/ansible/elastic-install/files"

mkdir $destdir

rm -f $destdir/minio-*.rpm

wget -N $location_server"/minio.asc" -P $destdir


wget -N $location_server"/minio-*.0.0.x86_64.rpm" -P $destdir
wget -N $location_client"/mcli-*.0.0.x86_64.rpm" -P $destdir


