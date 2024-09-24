FROM mysql:8.0

# cat /etc/my.cnf
COPY ./dbrd/mysqld.cnf /etc/mysql/conf.d/mysqld.cnf

RUN set -eux \
    && chmod o-wx /var/run/mysqld

CMD ["mysqld"]
