.PHONY: all composer-install composer-update composer start stop destroy rebuild shell root-shell drupal7 drupal8 wordpress
.DEFAULT_GOAL:=help

current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

##@ Helpers

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@  🐘  Composer

composer-install: CMD=install ## Install composer dependencies
composer-update: CMD=update ## Update composer dependencies

# Usage example (add a new dependency): `make composer CMD="require --dev symfony/var-dumper ^4.2"`
composer composer-install composer-update:
	@docker run --rm --interactive --tty --volume $(current-dir):/app --user $(id -u):$(id -g) \
		takamichi/composer $(CMD) \
			--no-ansi \
			--no-interaction \
			--ignore-platform-reqs


##@  🐳  Docker Compose

start: ## Boot up containers
	docker-compose up -d

#stop: CMD=stop  ## Stop containers
stop: ## Stop containers
	docker-compose stop

destroy: ## Stop and delete containers and volumes
	docker-compose down -v

rebuild: ## Force rebuild containers
	docker-compose build --pull --force-rm --no-cache
	make start

shell: ## Attach to a user shell session
	docker-compose exec --user=1000:1000 web bash

root-shell: ## Attach to a root shell session
	docker-compose exec web /bin/bash

##@  💿  Install Software

drupal7: ## Install Drupal 7
	./scripts/install_drupal7.sh
	
drupal8: ## Install Drupal 8
	./scripts/install_drupal8.sh

wordpress: ## Install WordPress
	./scripts/install_wp.sh


##@
