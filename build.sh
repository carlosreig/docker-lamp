#!/bin/bash
FILEPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
SCRIPTDIR=`dirname $FILEPATH`
PROJECTNAME=`basename $SCRIPTDIR`

docker build -t lamp-mysql mysql
docker build -t lamp-ngynx ngynx
docker pull mailhog/mailhog

docker run -p 3306:3306 --name $PROJECTNAME-mysql -d lamp-mysql
docker run -p 1025:1025 -p 8025:8025 --name $PROJECTNAME-mail -d mailhog/mailhog
docker run -p 80:80 -p 443:443 -v $SCRIPTDIR/www:/usr/share/nginx/html:rw --link $PROJECTNAME-mysql:db --link $PROJECTNAME-mail:mail --name $PROJECTNAME-nginx -d lamp-nginx
