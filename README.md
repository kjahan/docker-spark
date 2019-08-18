# docker-spark
Run Apache Spark in Docker.

## Start your Spark container:

docker pull

run -i -t IMAGE_ID /bin/bash

Run spark script from inside the container:

cd /src/
spark-submit election.py

## Building spark-docker image
If you want to build the docker image yourself, just clone the project and then create a folder "opt" in the source directory of the cloned project and then download and copy apach spark, jdk and your data there.

# Requirements

Download and install Docker Desktop for your machine:

https://docs.docker.com/docker-for-mac/install/

Download Apache spark (spark-2.4.3-bin-hadoop2.7.tgz) from the link below:

https://www.apache.org/dyn/closer.lua/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz

Download the JDK Software: 

https://docs.oracle.com/cd/E19182-01/820-7851/inst_cli_jdk_javahome_t/

Build your docker image:

docker build --tag spark .

Push your image to Docker Hub:

export DOCKER_ID_USER="YOUR_DOCKER_USERNAME"
docker login
docker push $DOCKER_ID_USER/spark