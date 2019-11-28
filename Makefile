APPDIR=/var/www/app
GLOBALCOMPOSER=/home/vagrant/.config/composer/vendor

test:
	vagrant ssh -- "$(APPDIR)/bin/phpunit -c $(APPDIR)/phpunit.xml.dist"
	
cs:
	vagrant ssh -- "$(GLOBALCOMPOSER)/bin/phpcs --report=summary $(APPDIR)/src --standard=$(GLOBALCOMPOSER)/escapestudios/symfony2-coding-standard/Symfony/ruleset.xml"
	
.PHONY: test cs