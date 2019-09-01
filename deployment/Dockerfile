FROM ubuntu:latest
RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install python3.7 -y
RUN apt-get install wget -y
RUN mkdir -p /opt/docker-spark/src
RUN mkdir -p /opt/docker-spark/data
RUN mkdir -p /usr/jdk
RUN cd /opt/ && wget https://www.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN cd /usr/jdk/ && wget https://download.java.net/java/GA/jdk12.0.2/e482c34c86bd4bf8b56c0b35558996b9/10/GPL/openjdk-12.0.2_linux-x64_bin.tar.gz
COPY src/election.py /opt/docker-spark/src
COPY data/election.txt /opt/docker-spark/data
RUN cd /opt/ && tar -xvzf spark-2.4.3-bin-hadoop2.7.tgz && \
    rm -f spark-2.4.3-bin-hadoop2.7.tgz
RUN cd /usr/jdk && tar xzvf openjdk-12.0.2_linux-x64_bin.tar.gz && \
	rm -f openjdk-12.0.2_linux-x64_bin.tar.gz
RUN ln -s /usr/bin/python3.7 /usr/bin/python
ENV JAVA_HOME="/usr/jdk/jdk-12.0.2/"
ENV PATH="${JAVA_HOME}/bin:/opt/spark-2.4.3-bin-hadoop2.7/bin:${PATH}"