# docker-spark
Run Apache Spark in Docker.  There are lots of times that a developer wants to setup her local machine as the spark development node so that she can do her development while being able to run and test her code on her machine which has been setup in an standalone cluster mode.  This will speedup the code development and then you can use your staging or production cluster as the deployment stage.

However, if you want to setup an stanalone cluster spark on your local machine, there are a few configuration steps that you have to take.  This specially become a bit cumbersome when you're using other platforms than Linux such as Mac OS or Wirndows.  One way to get around this issue is to take advantage of a docker containers.  We have setup a docker image based on Ubuntu with spark setup so that independently from your machine OS, you can pull the image from the Docker Hub and run the node on your local machine for your development environment.

See "Start your Spark container" section below for the steps.  If you want to make changes to the image and build your own customized docker image, you should check "Building your Spark Docker image".  Note that this repository includes a Dockerfile that you can built on top for your own customized needs.

If you have any questions/suggestions, reach out to me at: "kjahanbakhsh AT GMAIL DOT com".

## Start your Spark container:
export DOCKER_ID_USER="YOUR_DOCKER_USERNAME"
docker login
docker pull $DOCKER_ID_USER/spark

docker run -i -t IMAGE_ID /bin/bash

Run spark script from inside the container:

cd /src/
spark-submit election.py

## Building your Spark Docker image:
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
docker tag spark $DOCKER_ID_USER/spark
docker push $DOCKER_ID_USER/spark