cp -i ~/ELK-starter/configs/logstash/logstash-configs.conf /etc/logstash/conf.d
cp -i ~/ELK-starter/configs/nginx/my-default /etc/nginx/sites-available/
cp -f ~/ELK-starter/configs/kibana/kibana.yml /opt/kibana/config/
cp -f ~/ELK-starter/configs/elasticsearch/elasticsearch.yml /etc/elasticsearch/
cp -f ~/ELK-starter/configs/ssl/openssl.cnf /etc/ssl/
cp -avr ~/ELK-starter/shop-around/index.html /usr/share/nginx/html/
cp -avr ~/ELK-starter/shop-around/css/ /usr/share/nginx/html/
cp -avr ~/ELK-starter/shop-around/js/ /usr/share/nginx/html/
