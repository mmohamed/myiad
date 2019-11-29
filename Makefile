APPDIR=/var/www/app
GLOBALCOMPOSER=/home/vagrant/.config/composer/vendor

install:
	vagrant ssh  -- "cp $(APPDIR)/.env.dist $(APPDIR)/.env"
	vagrant ssh  -- "sed -i -e 's/DATABASE_URL/#DATABASE_URL/g' $(APPDIR)/.env"
	vagrant ssh  -- "echo 'DATABASE_URL=pgsql://demo:demo@127.0.0.1:5432/demo' >> $(APPDIR)/.env"
	vagrant ssh  -- "$(APPDIR)/bin/console doctrine:database:create --if-not-exists --env=dev"
	vagrant ssh  -- "$(APPDIR)/bin/console doctrine:schema:update --force --env=dev"
	vagrant ssh  -- "$(APPDIR)/bin/console doctrine:fixtures:load -n --env=dev"
	
test:
	vagrant ssh  -- " cp $(APPDIR)/phpunit.xml.dist $(APPDIR)/phpunit.xml"
	vagrant ssh  -- " sed -i -e 's/\/\/\/var/\/\/\/\/var\/www\/app\/var/g' $(APPDIR)/phpunit.xml"
	vagrant ssh  -- " $(APPDIR)/bin/phpunit -c $(APPDIR)/phpunit.xml --verbose"
	
cs:
	vagrant ssh -- "$(GLOBALCOMPOSER)/bin/phpcs --report=summary $(APPDIR)/src --standard=$(GLOBALCOMPOSER)/escapestudios/symfony2-coding-standard/Symfony/ruleset.xml"
	
.PHONY: install test cs