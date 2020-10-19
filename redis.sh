#!/usr/bin/env bash
docker rm -f redis-for-log

DIR=/data/redis-for-log
mkdir -p $DIR
chown -R 1001:1001 $DIR

docker run -itd \
    --name redis-for-log \
    --restart always \
    -m 1024m \
    -v $DIR:/bitnami/redis/data \
    -e "REDIS_PASSWORD=pAssw0rd" \
    -p 6379:6379 \
    redis:5.0.8
