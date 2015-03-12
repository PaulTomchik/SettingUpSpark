sed '/# - SPARK_MASTER_IP.*$/a export SPARK_MASTER_IP=192.168.56.110' ~/opt/spark/conf/spark-env.sh.template >> ~/opt/spark/conf/spark-env.sh


printf "sparkslave1\nsparkslave2" >> ~/opt/spark/conf/slaves

cp masterSSHconfig ~/.ssh/config
