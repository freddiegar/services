FROM mysql:8.0

# cat /etc/my.cnf
COPY ./db80/mysqld.cnf /etc/mysql/conf.d/mysqld.cnf

RUN set -eux \
    && chmod o-wx /var/run/mysqld

CMD ["mysqld"]
