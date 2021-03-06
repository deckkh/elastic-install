echo -n "enter elastic version to download : "
read version

location="https://artifacts.elastic.co/downloads"
destdir="/opt/ansible/elastic-install/files"

mkdir $destdir

rm -f $destdir/elasticsearch-*.rpm
rm -f $destdir/logstash-*.rpm
rm -f $destdir/kibana-*.rpm
rm -f $destdir/filebeat-*.rpm
rm -f $destdir/metricbeat-*.rpm
rm -f $destdir/repository-s3-*.zip
rm -f $destdir/GPG-KEY-elasticsearch

wget -N "https://artifacts.elastic.co/GPG-KEY-elasticsearch" -P $destdir

wget -N $location"/elasticsearch/elasticsearch-"$version"-x86_64.rpm" -P $destdir
wget -N $location"/kibana/kibana-"$version"-x86_64.rpm" -P $destdir
wget -N $location"/logstash/logstash-"$version"-x86_64.rpm" -P $destdir
wget -N $location"/beats/filebeat/filebeat-"$version"-x86_64.rpm" -P $destdir
wget -N $location"/beats/metricbeat/metricbeat-"$version"-x86_64.rpm" -P $destdir
wget -N $location"/elasticsearch-plugins/repository-s3/repository-s3-"$version".zip" -P $destdir

