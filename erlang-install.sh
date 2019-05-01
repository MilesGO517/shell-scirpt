#!/bin/bash
#Erlang install script
#named erlang-install.sh
#CentOS 7.5
#otp_src_20.0
cd /usr/src
#wget http://erlang.org/download/otp_src_20.0.tar.gz 这个地址有点慢，我暂时用自己的服务器地址代替
wget http://206.189.130.227:8080/downloads/otp_src_20.0.tar.gz
tar -zxvf otp_src_20.0.tar.gz
cd otp_src_20.0/
\cp /usr/share/libtool/config/config.guess /usr/src/otp_src_20.0/lib/erl_interface/src/auxdir/
\cp /usr/share/libtool/config/config.guess /usr/src/otp_src_20.0/lib/wx/autoconf/ 
\cp /usr/share/libtool/config/config.guess /usr/src/otp_src_20.0/lib/common_test/priv/auxdir/ 
\cp /usr/share/libtool/config/config.guess /usr/src/otp_src_20.0/lib/common_test/test_server/
\cp /usr/share/libtool/config/config.guess /usr/src/otp_src_20.0/erts/autoconf/
\cp /usr/share/libtool/config/config.sub /usr/src/otp_src_20.0/lib/erl_interface/src/auxdir/
\cp /usr/share/libtool/config/config.sub /usr/src/otp_src_20.0/lib/wx/autoconf/
\cp /usr/share/libtool/config/config.sub /usr/src/otp_src_20.0/lib/common_test/priv/auxdir/
\cp /usr/share/libtool/config/config.sub /usr/src/otp_src_20.0/lib/common_test/test_server/
\cp /usr/share/libtool/config/config.sub /usr/src/otp_src_20.0/erts/autoconf/
./configure --enable-shared
./configure --with-ssl=/etc/ssl --prefix=/opt/erlang
make && make install 
echo "ERLANG_HOME=/opt/erlang" >> /etc/profile
echo "export PATH=\$PATH:\$ERLANG_HOME/bin" >> /etc/profile
echo "export ERLANG_HOME" >> /etc/profile
source /etc/profile
