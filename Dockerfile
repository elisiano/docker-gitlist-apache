FROM php:7-apache
LABEL \
	maintainer="Elisiano Petrini <elisiano@gmail.com>" \
	org.label-schema.vcs-url="https://github.com/elisiano/docker-gitlist-apache" \
	org.label-schema.version="464d4db963b7d4de02b4505f051091b9adbb41df"

COPY config.ini /var/www/html/
COPY preinit-user.sh /usr/local/bin/

# Use the release version so no other developers tools necessary (all comes bundled)
#ENV GITLIST_LINK https://github.com/klaussilveira/gitlist/releases/download/0.6.0/gitlist-0.6.0.tar.gz
ENV GITLIST_LINK https://api.github.com/repos/klaussilveira/gitlist/tarball/464d4db963b7d4de02b4505f051091b9adbb41df

RUN apt-get update && apt-get install -y git \
	&& find /var/lib/apt/lists -type f -exec rm {} \; \
	&& curl -sL $GITLIST_LINK | tar --strip-components 1 -C /var/www/html -xzf - \
	&& curl -s http://getcomposer.org/installer | php \
	&& php composer.phar install \
	&& mkdir /var/www/html/cache 2>/dev/null || true \
	&& chmod -R 777 /var/www/html/cache \
	&& a2enmod rewrite

CMD [ "/usr/local/bin/preinit-user.sh" ]
