#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"
cd ..;


if [ "$#" -ne 1 ]; then
    echo "Usage: ./scripts/install_project.sh git@repository.git"
	exit;
fi

rm -rf www;
git clone $1 www

./start.sh

if [ -f "./www/setup.sh" ]; then
	docker-compose exec web sh -c "bash /var/www/html/setup.sh full"
fi

./stop.sh
./start.sh
