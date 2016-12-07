FROM ubuntu:latest
MAINTAINER Vladislav Stetsenko <v.stecenko@nitralabs.com>

# install git and pip
RUN apt-get update && apt-get install -y python-pip git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#clone work glacier project and set workdir with start python setup
RUN git clone https://github.com/uskudnik/amazon-glacier-cmd-interface.git
WORKDIR amazon-glacier-cmd-interface
RUN python setup.py install

#innstall aws client for ubuntu
RUN apt install awscli/xenial