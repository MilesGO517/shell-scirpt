# boost-install
### 参考资料
https://www.cnblogs.com/gattaca/p/6296235.html
https://www.cnblogs.com/eagle6688/p/5840773.html
https://www.cnblogs.com/dj0325/p/7977692.html

### 安装过程
```
# 安装依赖
yum install python-devel

cd /usr/src
wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz


tar -xzvf boost_1_69_0.tar.gz

cd boost_1_69_0

./bootstrap.sh --prefix=/usr/local/include/boost
# 在安装的时候发现后面的/include/boost是自动添加的
./bootstrap.sh --prefix=/usr/local/boost

# 安装
./b2 install

# 配置环境变量
vi /etc/profile

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/boost/lib
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/boost/lib
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/local/boost/include
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/local/boost/include

source /etc/profile

# 测试
g++ -o boost boost-test.cpp
默认生成boost.o
./boost.o执行


```