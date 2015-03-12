cd ~
mkdir -p ~/opt
cd opt
wget http://www.apache.org/dyn/closer.cgi/spark/spark-1.2.1/spark-1.2.1-bin-hadoop2.4.tgz
tar xvf spark-1.2.1-bin-hadoop2.4.tgz
ln -s ~/opt/spark-1.2.1-bin-hadoop2.4 spark

echo  'export PATH="${PATH}:${HOME}/opt/spark/bin"' >> ~/.bashrc
