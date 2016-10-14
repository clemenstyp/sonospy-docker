FROM   ubuntu:latest
MAINTAINER	Clemens Putschli <clemens@putschli.de>

RUN apt-get -y update && \
    apt-get install -y python && \
    apt-get install -y git && \
    apt-get install -y ffmpeg && \
    apt-get install -y lame && \
    apt-get install -y sox && \
    git clone git://github.com/henkelis/sonospy.git


CMD ./sonospy/sonospy_proxy 
