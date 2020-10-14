#!/bin/sh
service nginx start
service php7.3-fpm start
service mysql start
mysql -u root -e'create database wp;'
mysql -u root -e'grant all privileges on wp.* to wp@localhost identified by "password";'
/bin/bash
