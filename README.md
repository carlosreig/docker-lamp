# A LAMP environment using docker
A file structrure to have a full Drupal 7 installation in a docker container.

Features
========
  - A LAMP environment running in just one command (Apache 2.4 - PHP 5.5 - MySQL 5.5)
  - Prepared to have as many containers as you want (usually one per project)
  - Composer installed
  - XDebug installed
  - [Mailhog](https://github.com/mailhog/MailHog) installed for working with emails locally
  
How to use
=========

There are 5 bash files to have a really easy way to do the common operations:
  - build.sh: This script **should be only used once**. It is the responsible for setting up the LAMP environment
  - start.sh: This script has to be executed everytime that you want to start LAMP.
  - stop.sh: This script should be executed everytime that you finish working with LAMP.
  - clean.sh: This script is auxiliary, just in case you want to remove your LAMP environment. **By executing that script the database data will be removed**
  
First time workflow
=======
	* Do clone that repo and give to the repo folder a name related with your project.
	* Execute the build.sh script to initialize your environment
``./build.sh``
	* Go to http://localhost and you should see a sucessful message
  * Remove the www/index.html and place all your project's files in the folder www/

Now you have your environment ready! Just remember to execute stop.sh when you finish.

Normal workflow
======

  * Execute the start.sh script to start LAMP (`./start.sh`)
  * When you finish working execute the stop.sh script (`./stop.sh`)

Helper scripts
==========

  - You can install Drush 7 + Drupal 7 by executing `./scripts/install_drupal7.sh`
  - You can install Drush 8 + Drupal 8 by executing `./scripts/install_drupal8.sh`
  - You can access to the bash by executing `./bash.sh`

Misc
======

If you want to get a terminal in the apache (to execute drush or something else):

``docker exec -t -i drupal-web /bin/bash``
