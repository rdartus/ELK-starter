#nginx
sudo apt-get install apache2-utils -y
sudo apt-get install nginx selinux-basics selinux-policy-default auditd gedit dkms build-essential linux-headers-generic -y

#install java8
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

sudo apt-get -y install apt-transport-https
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
sudo apt-get update
sudo apt-get install logstash -y

#install elasticsearch
sudo apt-get -y install elasticsearch

#install kibana
sudo apt-get -y install kibana


# old version
#install logstash
# echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash-2.2.x.list
# sudo apt-get update
# sudo apt-get install logstash -y --allow-unauthenticated
#
# #install elasticsearch
# wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
# echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
# sudo apt-get update
# sudo apt-get -y install elasticsearch
#
# #install kibana
# echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.4.x.list
# sudo apt-get update
# sudo apt-get -y install kibana


#add the exe to the booting sequence
sudo update-rc.d kibana defaults
sudo update-rc.d kibana enable
sudo update-rc.d elasticsearch defaults
sudo update-rc.d elasticsearch enable

sudo service kibana start
sudo service elasticsearch restart
sudo mkdir -p /etc/pki/tls/certs
sudo mkdir /etc/pki/tls/private

#Find the [ v3_ca ]
# add the following under the section title
#subjectAltName = IP: ELK_server_private_IP
# sudo nano /etc/ssl/openssl.cnf
cd /etc/pki/tls
sudo openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt

#restart the services
sudo htpasswd -c /etc/nginx/htpasswd.users jeank

sudo chmod +x ~/ELK-starter/config.sh
sudo ~/ELK-starter/config.sh

sudo service nginx restart
sudo service kibana restart
sudo service logstash restart
sudo service elasticsearch restart

# password for reverse proxy-kibana
# create the user jeank
# specify the password mdp
