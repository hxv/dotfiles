all_targets += php

php_ppa = /etc/apt/sources.list.d/ondrej-ubuntu-php-$(ubuntu_codename).list

php: /usr/bin/php8.1 ~/bin/composer ~/.config/composer/vendor/bin/psysh
.PHONY: php

$(php_ppa):
	sudo add-apt-repository -y ppa:ondrej/php

/usr/bin/php8.1: $(php_ppa)
	sudo apt install -y php8.1-cli php8.1-amqp php8.1-ast php8.1-bcmath php8.1-bz2 php8.1-curl \
		php8.1-dba php8.1-dev php8.1-gd php8.1-gmp php8.1-imagick php8.1-imap php8.1-intl \
		php8.1-ldap php8.1-mbstring php8.1-memcache php8.1-memcached php8.1-mongodb \
		php8.1-mysql php8.1-odbc php8.1-opcache php8.1-pgsql php8.1-readline php8.1-redis \
		php8.1-soap php8.1-sqlite3 php8.1-uuid php8.1-xdebug php8.1-xml php8.1-xsl \
		php8.1-yaml php8.1-zip
	sudo touch $@

~/bin/composer: /usr/bin/php8.1
	wget -O /tmp/composer-setup https://getcomposer.org/installer
	rm -rf ~/bin/composer
	mkdir -p ~/bin
	php /tmp/composer-setup --install-dir=$(shell realpath ~/bin) --filename=composer

~/.config/composer/vendor/bin/psysh:
	composer global require psy/psysh
