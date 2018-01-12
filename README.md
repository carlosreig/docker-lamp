# A LAMP environment using docker
A few scripts to have a LAMP environment with docker in a **really easy** way.

Features
========
  - A LAMP environment running in just one command (Apache 2.4 - PHP 7.1 - MySQL 5.5)
  - Prepared to have as many containers as you want (usually one per project)
  - Composer installed
  - XDebug installed
  - [Mailhog](https://github.com/mailhog/MailHog) installed for working with emails locally

How to use
=========

There are 5 bash files to have a really easy way to do the common operations:
  - start.sh: This script has to be executed everytime that you want to start LAMP.
  - stop.sh: This script should be executed everytime that you finish working with LAMP.
  - clean.sh: This script is auxiliary, just in case you want to remove your LAMP environment. **By executing that script the database data will be removed**
  - You can access to the bash by executing `./bash.sh`
  - You can access to the bash as a the **root user** by executing `./root_bash.sh`

First time workflow
=======
  - Do clone that repo and give to the repo folder a name related with your project.
  - Execute the start.sh script to initialize your environment
``./start.sh``
  - Go to http://localhost and you should see a sucessful message
  - Remove the www/index.html and place all your project's files in the folder www/

Now you have your environment ready! Just remember to execute stop.sh when you finish.

Normal workflow
======

  * Execute the start.sh script to start LAMP (`./start.sh`)
  * When you finish working execute the stop.sh script (`./stop.sh`)

Helper scripts
==========

  - You can install Drush + Drupal 7 by executing `./scripts/install_drupal7.sh`
  - You can install Drush + Drupal 8 by executing `./scripts/install_drupal8.sh`
  - You can install WP CLI + Wordpress by executing `./scripts/install_wp.sh`
  - You can access to the bash by executing `./bash.sh`
  - You can access to the bash as a the **root user** by executing `./root_bash.sh`

Notes
======

  - The database server host is not 'localhost'. Use 'db' instead of 'localhost'.
  - The database user is 'root' and the password is '123'
  - You can access to Mailhog in http://localhost:8025
