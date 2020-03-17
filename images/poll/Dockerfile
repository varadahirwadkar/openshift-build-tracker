FROM ubuntu:18.04
USER root
RUN apt update && apt install curl gnupg2 -y
RUN apt-get update && apt install --yes nodejs gifsicle \
        openjdk-8-jre \
        python-pip \
        make \
        unzip \
        jq \
        pkg-config \
        wget \
        git \
        curl \
	    sudo \
        python3 \
    && rm -rf /var/lib/apt/lists/*
RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

