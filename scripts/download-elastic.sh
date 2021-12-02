echo -n "enter elastic version : "
read version

wget -N 'https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-'$version'-x86_64.rpm'
wget -N 'https://artifacts.elastic.co/downloads/kibana/kibana-'$version'-x86_64.rpm'
wget -N 'https://artifacts.elastic.co/downloads/logstash/logstash-'$version'-x86_64.rpm'
wget -N 'https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-'$version'-x86_64.rpm'
wget -N 'https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-'$version'-x86_64.rpm'
