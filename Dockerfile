#OS
FROM debian:buster
#Name
MAINTAINER Michiro Narazaki <mnarazak@student.42tokyo.jp>
#Install by apt-get
RUN	apt-get update && \
	apt-get install -y \
	nginx \
	php7.3-fpm \
	php-mysql \
	php-mbstring \
	mariadb-server \
	mariadb-client \
	vim \
	zip \
	wget && \
#Install wordpress
	wget https://wordpress.org/latest.tar.gz && \
	tar xsfv latest.tar.gz && \
	mv /wordpress/ /var/www/ && \
	wget	https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip && \
#Install entrykit
	wget	https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz &&\
	tar -xvzf entrykit_0.4.0_Linux_x86_64.tgz && \
	rm entrykit_0.4.0_Linux_x86_64.tgz && \
	mv entrykit /bin/entrykit && \
	chmod +x /bin/entrykit && \
	entrykit --symlink && \
#phpadmin
	unzip phpMyAdmin-5.0.4-all-languages.zip && \
	mv phpMyAdmin-5.0.4-all-languages phpMyAdmin && \
	mv phpMyAdmin /usr/share/ && \
#SSL
	mkdir /root/rootCA && \
	openssl genrsa -out /root/rootCA/server.key && \
	openssl req -new -key /root/rootCA/server.key -out /root/rootCA/cacert.csr -subj '/C=JP/ST=Tokyo/L=Tokyo/O=42/OU=mnarazak/CN=localhost' && \
	openssl x509 -days 3650 -in /root/rootCA/cacert.csr  -req -signkey /root/rootCA/server.key -out /root/rootCA/server.crt
#COPY & ADD required files
COPY	srcs/nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl
ADD	srcs/config.inc.php /usr/share/phpMyAdmin/
ADD	srcs/phpmyadmin.conf /etc/nginx/
ADD	srcs/wp-config.php /var/www/wordpress/
ADD	srcs/ssl.conf /etc/nginx/
ADD	srcs/wordpress.conf /etc/nginx/
ADD	srcs/https.conf /etc/nginx/conf.d/
ADD	srcs/http.conf /etc/nginx/conf.d/
ADD	srcs/404.html /var/www/html/
ADD	srcs/cmd.sh ./
ADD	srcs/start.sh ./
#Auth
RUN	chown -R www-data:www-data /usr/share/phpMyAdmin && \
	chown -R www-data:www-data /var/www/wordpress/wp-config.php
#make nginx.conf & do ./cmd.sh
ENTRYPOINT ["render","etc/nginx/nginx.conf","--","./cmd.sh"]
