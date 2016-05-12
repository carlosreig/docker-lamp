#!/bin/bash
FILEPATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
SCRIPTDIR=`dirname $FILEPATH`
PROJECTNAME=`basename $SCRIPTDIR`

docker build -t lamp-apache apache
docker build -t lamp-mysql mysql
docker pull mailhog/mailhog

docker run -p 3306:3306 --name $PROJECTNAME-mysql -d lamp-mysql
docker run -p 1025:1025 -p 8025:8025 --name $PROJECTNAME-mail -d mailhog/mailhog
docker run -p 80:80 -v $SCRIPTDIR/www:/var/www/html:rw --link $PROJECTNAME-mysql:db --link $PROJECTNAME-mail:mail --name $PROJECTNAME-apache -d lamp-apache
