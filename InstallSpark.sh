cd ~
mkdir -p ~/opt
cd opt
wget http://mirrors.gigenet.com/apache/spark/spark-1.2.1/spark-1.2.1.tgz
tar zxvf spark-1.2.1.tgz
ln -s ~/opt/spark-1.2.1.tgz spark

echo  'export PATH="${PATH}:${HOME}/opt/spark/bin"' >> ~/.bashrc
