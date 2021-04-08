FROM php:7

# Get composer.
RUN apt-get -y update && \
  apt-get --no-install-recommends -y install git openssh-server && \
  mkdir /terminus-application && \
  cd /terminus-application && curl -sS https://getcomposer.org/installer | php && \
  php composer.phar require pantheon-systems/terminus && \
  rm -rf /var/lib/apt/lists/*

COPY docker-resources/run.sh /run.sh

ENTRYPOINT ["/run.sh"]
