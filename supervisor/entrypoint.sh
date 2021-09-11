#!/bin/sh

if [ -f /etc/hosts_extra ];
then
    cat /etc/hosts_extra >> /etc/hosts;
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
