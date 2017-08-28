#!/bin/bash
# This is a wrapper which takes care of changing apache user uid/gid before handing off all the logic to the original entrypoint
set -e
if [ ! -z "$APACHE_UID" ]; then
	echo "Changing www-data user id to $APACHE_UID"
	usermod -u $APACHE_UID www-data
fi
if [ ! -z "$APACHE_GID" ]; then
	echo "Changing www-data group id to $APACHE_GID"
	groupmod -g $APACHE_GID www-data
fi

# finally invoke the original entrypoint
exec /usr/local/bin/apache2-foreground

