docker pull redis
docker pull mysql
docker pull mongo
docker pull solr
docker pull elasticsearch 
docker pull nacos/nacos-server
docker pull bitnami/kafka
docker pull bitnami/zookeeper
docker pull flink
docker pull seataio/seata-server

docker run --name redis -p 6379:6379 -d redis
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456789 -d mysql
docker run --name mongo -p 8635:8635 -d mongo
docker run --name solr -p 8983:8983 -d solr 
docker network create somenetwork
docker run --name elasticsearch --net somenetwork -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -d elasticsearch
docker run --name seata -p 8091:8091 seataio/seata-server
git clone --depth 1 https://github.com/nacos-group/nacos-docker.git
cd nacos-docker
docker-compose -f example/standalone-derby.yaml up
docker network create app-tier --driver bridge
docker run --name zookeeper -p 2181:2181 --network app-tier -e ALLOW_ANONYMOUS_LOGIN=yes -d bitnami/zookeeper
docker run --name kafka -p 9092:9092 --network app-tier -e ALLOW_PLAINTEXT_LISTENER=yes -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper-server:2181  -d bitnami/kafka
docker run --name flink -p 6123:6123 -d -t flink jobmanager

docker pull tensorflow/tensorflow
docker run -it --rm tensorflow/tensorflow bash
docker run -it --rm --runtime=nvidia tensorflow/tensorflow:latest-gpu python
