# Drupal 7 docker
A file structrure to have a full Drupal 7 installation in a docker container.

Features
========
  - Drush installed
  - Composer installed
  - The last Drupal 7 development version installed
  - Apache and MySQL in different docker containers
  
How to use
=========

There are 4 bash files to have a really easy way to do the common operations:
  - build.sh: This script should be only used once. It is the responsible for creating and running the two images that are needed to have Drupal 7 running: the one that will run Apache 2 and the one that will run MySQL 5.5.
  - start.sh: This script has to be executed everytime that you want to work with Drupal 7. It is the responsible for initialise the containers
  - stop.sh: This script should be executed everytime that you finish working with Drupal 7.
  - clean.sh: This script is auxiliary, just in case you want to remove the docker containers and images. **By executing that script the database data will be removed**
  
Normal workflow
=======

Once you clone the repo you will need to build the dockers containers by executing the build.sh script.

``./build.sh``

When the script ends you will have Drupal 7 installed in www/drupal7 and you will be able to access through [http://localhost/drupal7](http://localhost/drupal7).
Since that moment, everytime you want to have your environment working you will only have to execute the start.sh script

``./start.sh``

If you want to stop working you should execute the stop.sh script

``./stop.sh``

Misc
======

If you want to get a terminal in the apache (to execute drush or something else):

``docker exec -t -i drupal-web /bin/bash``
