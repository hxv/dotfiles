all_targets += php

php_ppa = /etc/apt/sources.list.d/ondrej-ubuntu-php-$(ubuntu_codename).list

php: /usr/bin/php8.0 /usr/bin/php7.4 ~/bin/composer ~/.config/composer/vendor/bin/psysh
.PHONY: php

$(php_ppa):
	sudo add-apt-repository -y ppa:ondrej/php

/usr/bin/php8.0: $(php_ppa)
	sudo apt install -y php8.0-cli php8.0-amqp php8.0-ast php8.0-bcmath php8.0-bz2 php8.0-curl \
		php8.0-dba php8.0-dev php8.0-gd php8.0-gmp php8.0-imagick php8.0-imap php8.0-intl \
		php8.0-ldap php8.0-mbstring php8.0-memcache php8.0-memcached php8.0-mongodb \
		php8.0-mysql php8.0-odbc php8.0-opcache php8.0-pgsql php8.0-readline php8.0-redis \
		php8.0-soap php8.0-sqlite3 php8.0-uuid php8.0-xdebug php8.0-xml php8.0-xsl \
		php8.0-yaml php8.0-zip
	sudo touch $@

/usr/bin/php7.4: $(php_ppa)
	sudo apt install -y php7.4-amqp php7.4-ast php7.4-bcmath php7.4-bz2 php7.4-cli php7.4-curl \
		php7.4-dba php7.4-dev php7.4-gd php7.4-gmp php7.4-imagick php7.4-intl php7.4-json \
		php7.4-ldap php7.4-mbstring php7.4-memcache php7.4-memcached php7.4-mongodb \
		php7.4-mysql php7.4-opcache php7.4-pgsql php7.4-readline php7.4-redis php7.4-soap \
		php7.4-sqlite3 php7.4-uuid php7.4-xdebug php7.4-xml php7.4-xmlrpc php7.4-xsl \
		php7.4-yaml php7.4-zip
	sudo touch $@

~/bin/composer: /usr/bin/php8.0
	wget -O /tmp/composer-setup https://getcomposer.org/installer
	rm -rf ~/bin/composer
	mkdir -p ~/bin
	php /tmp/composer-setup --install-dir=$(shell realpath ~/bin) --filename=composer

/etc/alternatives/php: /usr/bin/php8.0 /usr/bin/php7.4
	sudo update-alternatives --set php /usr/bin/php8.0

~/.config/composer/vendor/bin/psysh:
	composer global require psy/psysh
