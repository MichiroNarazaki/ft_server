#!/bin/sh
./start.sh
mysql -u root -e'create database wp;'
mysql -u root -e'grant all privileges on wp.* to wp@localhost identified by "password";'
/bin/bash
