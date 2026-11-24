FROM php:8.3

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        git \
        openssh-server \
        curl && \
    mkdir -p /terminus-application && \
    cd /terminus-application && \
    curl -fsSL https://getcomposer.org/installer | php && \
    php composer.phar require pantheon-systems/terminus && \
    rm -rf /var/lib/apt/lists/*

COPY docker-resources/run.sh /run.sh

ENTRYPOINT ["/run.sh"]
