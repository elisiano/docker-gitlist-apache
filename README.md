#  Docker GitList Apache
This docker image is based off of the original php:7-apache and it installs [GitList](https://gitlist.org).
As suggested on GitList docs, a release version is installed, not from any git branch, because it comes packaged with all the files needed.

The current version of GitLite is 0.6.0

#  How to use this image
You need to mount your repos directory to /repos on the image. On top of that you need to map a port to port 80.

```bash
docker run -it --rm -v /path/to/repos:/repos -p 8080:80 elisiano/gitlist-apache
```
if you want to use your own config.ini joust mount that on /var/www/html/config.ini

## Contribute
PR welcome at https://github.com/elisiano/docker-gitlist-apache
