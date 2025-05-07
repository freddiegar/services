# 2025-05-01: Migrate to 8.4 fails, Failed to add the foreign key constraint. Missing unique key for constraint
# 2025-05-07: Migrate to 8.3 fails, It's inestable
FROM mysql:8.0

# cat /etc/my.cnf
COPY ./dbrd/mysqld.cnf /etc/mysql/conf.d/mysqld.cnf

RUN set -eux \
    && chmod o-wx /var/run/mysqld

CMD ["mysqld"]
