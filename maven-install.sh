#!/bin/bash
#Maven install script
#named maven-install.sh
#CentOS7.5
#apache-maven-3.6.0
cd /usr/src
wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz
tar -zxf apache-maven-3.6.0-bin.tar.gz
mv apache-maven-3.6.0 /opt/maven3/
echo "export M2_HOME=/opt/maven3" >> /etc/profile 
echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$M2_HOME/bin" >> /etc/profile 
source /etc/profile
mvn -version