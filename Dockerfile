FROM php:7-apache
LABEL \
	maintainer="Elisiano Petrini <elisiano@gmail.com>" \
	org.label-schema.vcs-url="https://github.com/elisiano/docker-gitlist-apache"
	org.label-schema.version="0.6.0"

COPY config.ini /var/www/html/

# Use the release version so no other developers tools necessary (all comes bundled)
ENV GITLIST_LINK https://github.com/klaussilveira/gitlist/releases/download/0.6.0/gitlist-0.6.0.tar.gz

RUN apt-get update && apt-get install -y git \
	&& find /var/lib/apt/lists -type f -exec rm {} \; \
	&& curl -sL $GITLIST_LINK | tar --strip-components 1 -C /var/www/html -xzf - \
	&& mkdir /var/www/html/cache && chmod 777 /var/www/html/cache \
	&& a2enmod rewrite


