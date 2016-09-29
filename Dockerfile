FROM   ubuntu:latest
MAINTAINER	Clemens Putschli <clemens@putschli.de>

#Install libpcap-dev
RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
     apt-get install -y sudo && \
    apt-get install -y libpcap-dev && \
    apt-get install -y git && \
    apt-get install -y nodejs && \
    apt-get install -y npm && \
    apt-get install -y nodejs-legacy && \
    apt-get install -y libavahi-compat-libdnssd-dev && \
    apt-get install -y libasound2-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

#install dasher
RUN cd /root && export GIT_SSL_NO_VERIFY=1 && \
    git config --global http.sslVerify false && \
    git clone https://github.com/stephen/airsonos.git

WORKDIR /root/airsonos
RUN cd /root/airsonos && npm install -g

# Baseimage init process
CMD cd /root/airsonos  && node ./bin/index.js
