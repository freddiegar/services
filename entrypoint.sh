#!/bin/sh

service cron start

/usr/sbin/apachectl -D FOREGROUND
