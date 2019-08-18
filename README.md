# docker-spark
Run Apache Spark in Docker:

It's very common that an Apache Spark developer needs to setup her machine as a spark development node so that she can do her code development and testing.  This requires you to have a Spark node that has been setup in the stand-alone mode.  This can speedup the code development and you can use your staging/production clusters as the deployment environments.

However, setting up an stand-alone Spark cluster on your local machine could be time consuming task.  This specially becomes a bit cumbersome when you are using other platforms than Linux such as: Mac OS or Wirndows.  

One way to get around this problem is to take advantage of docker containers.  In this repo, we have setup a docker image based on Ubuntu with Spark setup on top so that independent from your host OS, you can pull the image from the Docker Hub and run the Spark node on your local machine for your development environment in order of minutes.

See "Start your Spark container" section below for the steps to run your container.  If you want to make changes to the image and build your own customized image, you should check "Building your Spark Docker image" section below.  Note that this repository includes a Dockerfile that you can edit for your own customized needs.

If you have any questions/suggestions, reach out to me at: "kjahanbakhsh AT GMAIL DOT com".

## Start your Spark container:
Clone this repo and change to the project folder.

export DOCKER_ID_USER="YOUR_DOCKER_USERNAME"
docker login
docker pull $DOCKER_ID_USER/spark

docker run -i -t IMAGE_ID /bin/bash

After ssh'ing to your docker node, run spark script inside the container as follows:

cd /src/
spark-submit election.py

## Building your Spark Docker image:
If you want to build the docker image yourself, just clone the project and then create a folder "opt" in the source directory of the cloned project and then download and copy apach spark, jdk and your data there.

# Requirements

Download and install Docker Desktop on your machine depending on your OS:

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