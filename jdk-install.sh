#!/bin/bash
#JDK install script
#named JDK-install.sh
# CentOS 7.5
# jdk1.8.0_201
cd ~/src
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz"
tar -xzvf jdk-8u201-linux-x64.tar.gz 
mv jdk1.8.0_201/ /opt/jdk
echo "JAVA_HOME=/opt/jdk" >> /etc/profile 
echo "JRE_HOME=/opt/jdk/jre" >> /etc/profile 
echo "CLASS_PATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar:\$JRE_HOME/lib" >> /etc/profile 
echo "PATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin" >> /etc/profile 
echo "export JAVA_HOME JRE_HOME CLASS_PATH PATH" >> /etc/profile 
source /etc/profile
java -version
