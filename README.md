# docker-spark
Run Apache Spark in Docker

1. Install Docker Desktop for Mac:
https://docs.docker.com/docker-for-mac/install/

2. Download spark:
https://www.apache.org/dyn/closer.lua/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz

docker pull ubuntu
docker images
docker run -i -t a2a15febcdf3 /bin/bash

docker cp ~/Downloads/spark-2.4.3-bin-hadoop2.7.tgz 4591e72c059f:/src

On the docker:
cd src
tar xzvf spark
apt-get update

Installing the JDK Software and Setting JAVA_HOME: 
https://docs.oracle.com/cd/E19182-01/820-7851/inst_cli_jdk_javahome_t/

mkdir /usr/jdk
tar xzvf jdk-12.0.2_linux-x64_bin.tar.gz

export JAVA_HOME=/usr/jdk/jdk-12.0.2/
export PATH=$JAVA_HOME/bin:$PATH

cd spark-2.4.3-bin-hadoop2.7/

apt-get install python3.7
ln -s /usr/bin/python3.7 /usr/bin/python
bin/pyspark

gunzip election.2016-06-08-23_09_08.txt.gz

docker cp src/election.py 4591e72c059f:/src

spark-2.4.3-bin-hadoop2.7/bin/spark-submit election.py