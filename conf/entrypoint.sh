#!/bin/sh

if [ -f /etc/hosts_extra ];
then
    cat /etc/hosts_extra >> /etc/hosts;
fi

service cron start

/usr/sbin/apachectl -D FOREGROUND
