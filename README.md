# A LAMP environment using docker
A few scripts to have a LAMP environment with docker in a **really easy** way.

Features
========
  - A LAMP environment running in just one command (Apache 2.4 - PHP 5.5 - MySQL 5.5)
  - Prepared to have as many containers as you want (usually one per project)
  - Composer installed
  - XDebug installed
  - [Mailhog](https://github.com/mailhog/MailHog) installed for working with emails locally
  
First time workflow
=======
  - Do clone that repo and give to the repo folder a name related with your project.
  - Execute the `docker-compose up -d`
  - Go to http://localhost and you should see a sucessful message
  - Remove the www/index.html and place all your project's files in the folder www/

Now you have your environment ready! Just remember to execute `docker-compose stop` when you finish.

Normal workflow
======

  * Execute the `docker-compose up -d` to start LAMP 
  * Stop the containers when you finish `docker-compose stop`

Helper scripts
==========

  - You can install Drush 7 + Drupal 7 by executing `./scripts/install_drupal7.sh`
  - You can install Drush 8 + Drupal 8 by executing `./scripts/install_drupal8.sh`
  - You can access to the bash by executing `./bash.sh`
  - You can access to the bash as a the **root user** by executing `./root_bash.sh`

Notes
======

  - The database server host is not 'localhost'. Use 'db' instead of 'localhost'.
  - The database user is 'root' and the password is '123'


