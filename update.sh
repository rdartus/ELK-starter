# sudo apt-get -y install apt-transport-https
# wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
# sudo apt-get install logstash -y
#
# #install elasticsearch
# sudo apt-get -y install elasticsearch
#
# #install kibana
# sudo apt-get -y install kibana

# update 2
curl -XPUT 'localhost:9200/_cluster/settings?pretty' -d'
{
  "persistent": {
    "cluster.routing.allocation.enable": "none"
  }
}'
curl -XPOST 'localhost:9200/_flush/synced?pretty'
curl -XGET 'localhost:9200/_cat/health?pretty'
curl -XGET 'localhost:9200/_cat/recovery?pretty'
