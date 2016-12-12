sudo apt-get -y install apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt-get install logstash -y 

#install elasticsearch
sudo apt-get -y install elasticsearch

#install kibana
sudo apt-get -y install kibana
