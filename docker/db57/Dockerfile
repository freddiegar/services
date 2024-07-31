FROM mysql:5.7

# cat /etc/my.cnf
COPY ./db57/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

RUN set -eux \
    && chmod o-wx /var/run/mysqld
#     apt-get update \
#     && apt-get install --no-install-recommends -y \
#     vim-tiny \
#     && apt-get autoremove -y

CMD ["mysqld"]
