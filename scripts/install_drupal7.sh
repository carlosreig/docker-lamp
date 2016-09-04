#!/bin/bash
docker-compose exec --user=1000:1000 web composer global require drush/drush
docker-compose exec web ln -s /home/www-bridge-user/.composer/vendor/bin/drush /usr/bin/drush
docker-compose exec --user=1000:1000 web sh -c 'drush dl -y --destination=/var/www/html --drupal-project-rename=drupal7 drupal-7.x && cd /var/www/html/drupal7 && drush si --db-url=mysql://root:123@db/drupal7 -y'