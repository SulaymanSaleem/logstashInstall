#! /bin/bash


echo "############## Installing Logstash ##############"
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install logstash

echo "###### COPYING S3 conf file to directory #######"
sudo cp s3_input.conf /etc/logstash/conf.d/
sudo cp logstash.service /etc/systemd/system/

echo "######### STARTING LOGSTASH ############"
sudo systemctl start logstash
sudo systemctl daemon-reload
tail -f /var/log/logstash/logstash-plain.log
 
