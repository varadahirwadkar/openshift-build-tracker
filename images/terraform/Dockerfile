FROM ubuntu:18.04
USER root
RUN apt update && apt install curl gnupg2 -y
RUN echo "deb https://deb.nodesource.com/node_8.x xenial main" | tee /etc/apt/sources.list.d/node.list
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN apt-get update && apt install --yes nodejs imagemagick gifsicle \
        imagemagick \
        openjdk-8-jre \
        libtest-www-selenium-perl \
        firefoxdriver \
        ruby-childprocess \
        python-pip \
        make \
        unzip \
        jq \
        pkg-config \
        wget \
        git \
        curl \
        python-selenium \
	sudo \
    && rm -rf /var/lib/apt/lists/*
RUN pip install python-openstackclient
RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

