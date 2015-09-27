#!/bin/bash
MAINPATH=$(dirname $(cd `dirname "${BASH_SOURCE[0]}"` && pwd))
PROJECTNAME=$(basename $MAINPATH)
echo $PROJECTNAME;

docker exec -i --user=1000:1000 $PROJECTNAME-apache composer global require drush/drush:7.*
docker exec $PROJECTNAME-apache ln -s /home/www-bridge-user/.composer/vendor/bin/drush /usr/bin/drush
docker exec -i --user=1000:1000 $PROJECTNAME-apache sh -c 'drush dl -y --destination=/var/www/html --drupal-project-rename=drupal7 drupal && cd /var/www/html/drupal7 && drush si --db-url=mysql://root:123@db/drupal7 -y'