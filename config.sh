cp -f ~/ELK-starter/configs/logstash/logstash-configs.conf /etc/logstash/conf.d
cp -f ~/ELK-starter/configs/logstash/nginx-conf2.conf /etc/logstash/conf.d
cp -f ~/ELK-starter/configs/logstash/nginx-conf.conf /etc/logstash/conf.d
mkdir -p /etc/logstash/patterns
cp -f ~/ELK-starter/configs/logstash/pattern-nginx /etc/logstash/patterns
cp -i ~/ELK-starter/configs/nginx/my-default /etc/nginx/sites-available/
rm  /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/my-default /etc/nginx/sites-enabled/
cp -i ~/ELK-starter/configs/nginx/proxy-kibana /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/proxy-kibana /etc/nginx/sites-enabled/
cp -f ~/ELK-starter/configs/kibana/kibana.yml /opt/kibana/config/
cp -f ~/ELK-starter/configs/elasticsearch/elasticsearch.yml /etc/elasticsearch/
cp -f ~/ELK-starter/configs/ssl/openssl.cnf /etc/ssl/
cp -avrf ~/ELK-starter/shop-around/* /usr/share/nginx/html/
