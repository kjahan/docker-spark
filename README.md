# Docker-Spark: Run Apache Spark in Docker!

![Image description](https://miro.medium.com/max/1838/1*VCxE-uUY7pYZy35ChJ1JtA.png)

We have seen a number of times that Machine Learning engineers need to setup their machine as an Apache Spark node for
development. The local Spark setup is necessary for development/testing.  We need an Spark node that has been
setup in an stand-alone mode.  This speeds up the code development and we can use the staging/production clusters as the
deployment environments.

However, setting up an stand-alone Spark cluster on your machine could be time consuming!  This specially becomes a bit
cumbersome when you're using other platforms other than Linux such as Microsoft Windows.

One simple way to get around this problem is to take advantage of Docker.  In this repo, we create an Ubuntu
docker image with Spark setup.  The whole setup process should take less than 15 minutes!

To build your docker image with Spark, check "Building your Spark Docker image" section.  Note that this repository
includes a "Dockerfile" that you can modify for your own needs.  If you have any questions/suggestions, ping me at:
"kjahanbakhsh AT GMAIL DOT com".

## Building your Docker image:
To build the docker image, clone the project and then run the following command from "docker-spark" folder:

docker build -t docker-spark:latest -f deployment/Dockerfile .

# To run your container and getting an ssh terminal, run:
docker run -i -t IMAGE_ID /bin/bash

After ssh'ing to your container, you can run spark script inside the container as follows:

cd /opt/docker-spark/src
spark-submit election.py

## Pushing your image to Docker Hub:
export DOCKER_ID_USER="YOUR_DOCKER_USERNAME"
docker login
docker tag spark $DOCKER_ID_USER/spark
docker push $DOCKER_ID_USER/spark