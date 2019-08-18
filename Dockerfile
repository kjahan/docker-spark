FROM ubuntu:latest
RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install python3.7 -y
RUN mkdir -p /src
RUN mkdir -p /usr/jdk
COPY opt/spark-2.4.3-bin-hadoop2.7.tgz /src/
COPY opt/jdk-12.0.2_linux-x64_bin.tar.gz /usr/jdk/
COPY src/election.py /src
COPY opt/election.2016-06-06-00_57_12.txt.gz /src/
RUN cd /src && tar -xvzf spark-2.4.3-bin-hadoop2.7.tgz && \
    rm -f spark-2.4.3-bin-hadoop2.7.tgz
RUN cd /usr/jdk && tar xzvf jdk-12.0.2_linux-x64_bin.tar.gz && \
	rm -f jdk-12.0.2_linux-x64_bin.tar.gz
RUN cd /src && gunzip election.2016-06-06-00_57_12.txt.gz && \
	rm -f election.2016-06-06-00_57_12.txt.gz
RUN ln -s /usr/bin/python3.7 /usr/bin/python
ENV JAVA_HOME="/usr/jdk/jdk-12.0.2/"
ENV PATH="${JAVA_HOME}/bin:/src/spark-2.4.3-bin-hadoop2.7/bin:${PATH}"