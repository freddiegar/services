FROM mysql:8.0

COPY ./dbrx/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN set -eux \
    && chmod o-wx /var/run/mysqld

CMD ["mysqld"]
