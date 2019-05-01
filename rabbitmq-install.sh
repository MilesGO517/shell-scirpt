#!/bin/bash
#RabbitMQ install script
#named rabbitmq-install.sh
cd /usr/src
wget https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.15/rabbitmq-server-generic-unix-3.6.15.tar.xz
xz -d rabbitmq-server-generic-unix-3.6.15.tar.xz 
tar -xvf rabbitmq-server-generic-unix-3.6.15.tar 
mv rabbitmq_server-3.6.15 /opt/rabbitmq
echo "export PATH=\$PATH:/opt/rabbitmq/sbin" >> /etc/profile
echo "export RABBITMQ_HOME=/opt/rabbitmq" >> /etc/profile
source /etc/profile
