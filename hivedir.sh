
stop-all.sh
nohup hdfs namenode -format &>/dev/null & 
start-all.sh
jps
hdfs dfs -mkdir /test
hdfs dfs -mkdir /tmp
hdfs dfs -chmod g+w /tmp
hdfs dfs -ls /
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
hdfs dfs -ls /user/hive
