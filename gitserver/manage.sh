#!/bin/bash
redis_port=$1
echo ${redis_port}
cd /data
rm -rf redis.conf
cp /app/redis.conf ./
chmod 777 redis.conf
sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/g" redis.conf
sed -i "s/protected-mode yes/protected-mode no/g" redis.conf
sed -i "s/dbfilename dump.rdb/dbfilename dump-${redis_port}.rdb/g" redis.conf
sed -i "s/appendonly.aof/appendonly-${redis_port}.aof/g" redis.conf
sed -i "s/dir ./dir \/data/g" redis.conf
sed -i "s/6379/${redis_port}/g" redis.conf
sed -i "s/# cluster-enabled yes/cluster-enabled yes/g" redis.conf
sed -i "s/# cluster-node-timeout 15000/cluster-node-timeout 5000/g" redis.conf
sed -i "s/# cluster-config-file nodes.*/cluster-config-file nodes-${redis_port}.conf/g" redis.conf
sed -i "s/appendonly no/appendonly yes/g" redis.conf
redis-server /data/redis.conf