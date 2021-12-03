echo -n "enter elastic version to download : "
read version

location='https://artifacts.elastic.co/downloads'
destdir='/tmp'

rm -f $destdir/elasticsearch-*.rpm
rm -f $destdir/logstash-*.rpm
rm -f $destdir/kibana-*.rpm
rm -f $destdir/filebeat-*.rpm
rm -f $destdir/metricbeat-*.rpm



wget -N '$location/elasticsearch/elasticsearch-'$version'-x86_64.rpm' -P $destdir
wget -N '$location/kibana/kibana-'$version'-x86_64.rpm' -P $destdir
wget -N '$location/logstash/logstash-'$version'-x86_64.rpm' -P $destdir
wget -N '$location/beats/filebeat/filebeat-'$version'-x86_64.rpm' -P $destdir
wget -N '$location/beats/metricbeat/metricbeat-'$version'-x86_64.rpm' -P $destdir
