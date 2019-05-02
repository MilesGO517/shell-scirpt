# gcc-install
### 写在前面
1. VPS上的gcc一般都比较旧，所以需要手动编译安装最新版的gcc；

2. gcc较大，对内存要求较高，如果虚拟机或服务器的内存较小，建议开大swap分区，我的服务器一开始根本没有swap分区，make步骤总是报错，后来开了swap分区就好了；
[编译前配置swap分区](https://www.jianshu.com/p/edb94d2c2395)
	
3. 由于编译新版gcc需要旧版gcc，所以开始不卸载旧版gcc，在make步骤后再卸载gcc（此处可能有依赖软件也需要卸载，后面记得安装回来），然后make install新版gcc；

4. 如果没有安装gcc，则可以先用yum安装一个；
yum -y install gcc gcc-c++ kernel-devel；

5. 编译后需要更新系统的动态链接库；

6. [gcc ftp 下载地址列表](https://ftp.gnu.org/gnu/gcc/)

### 编译安装步骤
```
cd /usr/src
wget https://ftp.gnu.org/gnu/gcc/gcc-8.3.0/gcc-8.3.0.tar.gz
tar -xzvf gcc-8.3.0.tar.gz
cd gcc-8.3.0

# 安装需要的依赖，这是GCC源码包提供的，只要执行一下就可以了。
./contrib/download_prerequisites
	yum -y install bzip2（如果报错lbzip2 cannot exec）

cd ..
mkdir build-gcc-8.3.0
cd build-gcc-8.3.0

../gcc-8.3.0/configure --prefix=/opt/gcc --enable-bootstrap --enable-checking=release --enable-languages=c,c++ --disable-multilib

make clean
# 编译很慢
make -j 4  

# 如果是服务器，可以在后台运行 
nohup make -j4 > /usr/src/build_log.txt &

# 查看已经安装的gcc
rpm -q gcc
#显示如下结果
gcc-4.4.7-23.el6.x86_64
# 需要卸载以安装更新的版本

rpm -e gcc-4.4.7-23.el6.x86_64
# 卸载失败，需要先卸载依赖
rpm -e gcc-c++-4.4.7-23.el6.x86_64
rpm -e libtool-2.2.6-15.5.el6.x86_64 （这个是别的软件的依赖，后面需要安装回来）

# 下面开始安装
make install

cd /opt/gcc/bin
./g++ -version
./gcc -version

# 加入系统环境变量
vi /etc/profile
export PATH=/opt/gcc/bin:$PATH

source /etc/profile

# 更新动态链接库
# https://blog.csdn.net/yuhuqiao/article/details/83624689

find / -name "libstdc++.so*"

cp /usr/src/build-gcc-8.3.0/x86_64-pc-linux-gnu/libstdc++-v3/src/.libs/libstdc++.so.6.0.25 /usr/lib64

cd /usr/lib64

rm -rf libstdc++.so.6

ln -s libstdc++.so.6.0.25 libstdc++.so.6


```