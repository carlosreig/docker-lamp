#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

docker-compose exec web sh -c "sed -i -e 's/www\/html/www\/html\/web/g' /etc/apache2/sites-enabled/000-default.conf"
docker-compose exec web sh -c "sed -i -e 's/www\/html/www\/html\/web/g' /etc/apache2/sites-enabled/default-ssl.conf"
rm -rf ../www;
cd .. && composer create-project drupal-composer/drupal-project:8.x-dev www
./stop.sh
./start.sh
docker-compose exec --user=1000:1000 web sh -c 'vendor/bin/drush si standard --db-url=mysql://root:123@db/drupal8 -y'
