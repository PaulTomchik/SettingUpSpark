cd ~
mkdir -p ~/opt
cd opt
wget http://apache.spinellicreations.com/spark/spark-1.2.1/spark-1.2.1-bin-hadoop2.4.tgz
tar zxvf spark-1.2.1-bin-hadoop2.4.tgz
ln -s ~/opt/spark-1.2.1-bin-hadoop2.4 spark

echo  'export PATH="${PATH}:${HOME}/opt/spark/bin"' >> ~/.bashrc
