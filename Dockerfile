FROM debian:buster
MAINTAINER Michiro Narazaki <mnarazak@student.42tokyo.jp>
#RUN: build時に実行される
RUN	echo "now building ..." && \
	apt-get update && \
	apt-get install -y \
	nginx \
	php7.3-fpm \
	php-mysql \
	mariadb-server \
	wget && \
	wget https://wordpress.org/latest.tar.gz
RUN	tar xsfv latest.tar.gz
RUN	mv /wordpress/ /var/www/
COPY	rootCA /root/rootCA/
ADD	nginx.conf /etc/nginx/
ADD	wp-config.php /var/www/wordpress/
ADD	cmd.sh ./
CMD	["./cmd.sh"]
EXPOSE	80
