#!/bin/bash
MAINPATH=$(dirname $(cd `dirname "${BASH_SOURCE[0]}"` && pwd))
PROJECTNAME=$(basename $MAINPATH)

docker exec -i --user=1000:1000 $PROJECTNAME-apache composer global require drush/drush:dev-master
docker exec $PROJECTNAME-apache ln -s /home/www-bridge-user/.composer/vendor/bin/drush /usr/bin/drush
docker exec -i --user=1000:1000 $PROJECTNAME-apache sh -c 'git clone --branch 8.2.x https://git.drupal.org/project/drupal.git /var/www/html/drupal8 && cd /var/www/html/drupal8 && composer install && drush si --db-url=mysql://root:123@db/drupal8 --account-pass=admin -y'
