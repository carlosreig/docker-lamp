#!/bin/bash
MAINPATH=$(dirname $(cd `dirname "${BASH_SOURCE[0]}"` && pwd))
PROJECTNAME=$(basename $MAINPATH)

docker exec -i --user=1000:1000 $PROJECTNAME-apache composer global require drush/drush:dev-master
docker exec $PROJECTNAME-apache ln -s /home/www-bridge-user/.composer/vendor/bin/drush /usr/bin/drush
docker exec -i --user=1000:1000 $PROJECTNAME-apache sh -c 'drush dl -y --destination=/var/www/html --drupal-project-rename=drupal8 drupal-8.0.x-dev && cd /var/www/html/drupal8 && drush si --db-url=mysql://root:123@db/drupal8 -y'