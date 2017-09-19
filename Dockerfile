FROM ubuntu

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install php
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install zip
RUN apt-get -y install unzip
RUN apt-get -y install php-xml

# Get composer.
RUN mkdir /terminus-application
RUN cd /terminus-application && curl -sS https://getcomposer.org/installer | php

# Require terminus
RUN cd /terminus-application && php composer.phar require pantheon-systems/terminus

# Make a workspace
RUN mkdir -p /dcycle/workspace

ADD docker-resources/run.sh /run.sh

CMD ["/run.sh"]
