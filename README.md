Services Setup
---

# Requisites

- docker
- docker-compose

## Setup

Set config vars in `.env` file

```bash
cp -p .env.example .env
```

## Services

### Deploy

Install services

```bash
docker-compose up -d SERVICE_NAME
```

### Override Services

You can override setup in docker (production environment maybe), rename `docker-compose.override.yml.example` to `docker-compose.override.yml` and customize your installation, by example:

```bash
cp -p docker-compose.override.yml.example docker-compose.override.yml
```

```yaml
services:
  # This service is shutdown
  db:
    entrypoint: "echo true"

```

## Verify

Verify development network

```bash
# Check if not exist
docker network ls | grep development
# Create network
docker network create --driver=bridge --subnet=172.20.0.0/16 --gateway=172.20.0.1 development
```

Allow access from another networks segment to containers development network

```bash
# Connect another network in each container and use name over ip
docker network connect <network-name> db80
docker network connect development db80
```
### Hosts

If DNS dont works, try editing `/etc/hosts`

```bash
# sudo vim /etc/hosts
# IPv4
127.0.0.1 development.local
172.20.0.10 db
172.20.0.20 cache
# IPv6
::1     development.local
```

## Binding data

Create folders data and log and set defaults

```bash
sudo mkdir -p /var/lib/mysql && sudo chown $(whoami):systemd-journal /var/lib/mysql
sudo mkdir -p /var/log/mysql && sudo chown $(whoami):systemd-journal /var/log/mysql
sudo chmod 666 /var/log/mysql/*/*.log
```
> Check Migration from 5.7. to 8.0
> mysqlcheck -uroot -p --all-databases --check-upgrade

## Supervisor

```bash
supervisorctl start all
supervisorctl status

# After change conf files
supervisorctl reread
supervisorctl update
```

## MySQL

Edit configuration file

```bash
docker exec -it db bash
apt update && apt install vim -y
vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

### Password (Less)

[See](https://akrabat.com/password-less-command-line-scripts-with-mysql-5-6/)

```bash
# Set credentials
mysql_config_editor set --login-path=development --host=db --user=root --password
# Use credentials
mysql --login-path=development
# Show save paths
mysql_config_editor print --all

# Replication
mysql_config_editor set --login-path=replication --host=dbrx --user=root --password
```

### Check config file

After change it run:

```bash
# which mysqld
mysqld --verbose --help
```

### Show Config

```mysql
SHOW VARIABLES LIKE '%version%';
SHOW VARIABLES LIKE '%max_connections%';
```

### Logs

[Slow queries](https://www.percona.com/blog/identifying-high-load-mysql-slow-query-log-pt-query-digest/)
[Bad and poorly queries](https://www.percona.com/blog/queries-for-finding-poorly-designed-mysql-schemas-and-how-to-fix-them/)

Save logs file:

```bash
[mysqld]
explicit_defaults_for_timestamp        = 1 # 1: Enable | 0: Disabled

sql-mode                               = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
log_error                              = /var/log/mysql/error.log
general_log                            = 0 # 1: Enable | 0: Disabled
general_log_file                       = /var/log/mysql/mysql.log
slow_query_log                         = 1 # 1: Enable | 0: Disabled
long_query_time                        = 1 # In seconds
log_queries_not_using_indexes          = 1 # 1: Enable | 0: Disabled
log_throttle_queries_not_using_indexes = 1 # Same query not using index in same minute
slow_query_log_file                    = /var/log/mysql/slow.log
```

### Memory

- Set memory from server available to use in MySQL:

```bash
[mysqld]

log_error_verbosity                    = 2 # 1: Error | 2: Errors + Warning | 3: Errors + Warnings + Info
key_buffer_size                        = 200MB # 20% of total RAM

innodb_buffer_pool_size                = 700M # 50% - 70 of total RAM
innodb_log_file_size                   = 175M # 25% of innodb_buffer_pool_size
innodb_flush_method                    = O_DIRECT # avoid double buffering
innodb_file_per_table                  = 1
innodb_stats_on_metadata               = 0
innodb_buffer_pool_instances           = 1 # or 8 if innodb_buffer_pool_size > 1GB

host_cache_size                        = 0
skip_name_resolve                      = 1
```
> Example using 1G RAM in server

### Charset

```bash
[client]
default-character-set                  = utf8

[mysql]
default-character-set                  = utf8

[mysqld]
character-set-server                   = utf8
collation-server                       = utf8_general_ci

[mysqld_safe]
default-character-set                  = utf8
```

### Tunning

[See](https://github.com/major/MySQLTuner-perl)

```bash
apt update && apt install curl -y
sudo curl -L https://raw.githubusercontent.com/major/MySQLTuner-perl/master/mysqltuner.pl -o /usr/local/bin/mysqltuner.pl
sudo chmod +x /usr/local/bin/mysqltuner.pl
# Localhost
mysqltuner.pl --host 127.0.0.1
# Remote
mysqltuner.pl --host 172.20.0.10 --forcemem [RAM in MB]
# CVE Security
mysqltuner.pl --host 172.20.0.10 --forcemem [RAM in MB] --cvefile
# Updated
# mysqltuner.pl --checkversion --updateversion
```

### Throuble

It it testing MySQL are slow? then

https://wiki.archlinux.org/title/Ext4

```bash
sudo /etc/fstab

# For example:
# # / was on /dev/ubuntu-vg/ubuntu-lv during curtin installation
# /dev/disk/by-id/dm-uuid-LVM-6QF7koNeY90W4g5etmQrf76ZKUZF03CkDp0I3iy2iBF8GgRv97rDTldeckBx3HRk / ext4 defaults,commit=60 0 1
```
> NOT uses barrier=0

### Restart

```bash
/etc/init.d/mysql restart
```

## MSSQL

[See](https://hub.docker.com/_/microsoft-mssql-server)
[Config](https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-mssql-conf?view=sql-server-ver15)

Command Line Tools in container

```bash
docker exec -it mssql bash
# Data and logs directory
# /var/opt/mssql/
# /var/opt/mssql/data
# /var/opt/mssql/log
# Status
# sudo systemctl start mssql-server
# sudo systemctl stop mssql-server
# Client
# /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P <password>
# Help
# /opt/mssql-tools/bin/sqlcmd -?
```

### Enable extension in PHP

[See](https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15)

[See](https://serverpilot.io/docs/how-to-install-the-php-sqlsrv-extension/)

In container

```bash
# Dependencies
apt-get install -y gnupg2
curl -s https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list
apt-get update
ACCEPT_EULA=Y apt-get -y install msodbcsql17
apt-get install -y unixodbc-dev
# apt-get -y install gcc g++ make autoconf libc-dev pkg-config
# Installation
sudo pecl install sqlsrv
# ecl install pdo_sqlsrv
# Enabled
echo "extension=$(find /usr/local/lib/php/extensions/ -name sqlsrv.so)" > /usr/local/etc/php/conf.d/sqlsrv.ini
# cat /usr/local/etc/php/conf.d/sqlsrv.ini
# echo "extension=$(find /usr/local/lib/php/extensions/ -name pdo_sqlsrv.so)" > /usr/local/etc/php/conf.d/pdo_sqlsrv.ini
# Restart apache to load changes
service apache2 reload

```

## Redis

```bash
# Install extension from PECL
sudo pecl install -f redis \
&& echo "extension=$(find /usr/local/lib/php/extensions/ -name redis.so)" > /usr/local/etc/php/conf.d/redis.ini
# cat /usr/local/etc/php/conf.d/redis.ini
# Restart apache to load changes
service apache2 reload
```

## VHosts (with subdomain)

Copy configuration of default setup

```bash
echo "<VirtualHost *:443>
    ServerName subdomain.development.local
    DocumentRoot "/var/www/html/subdomain/public/"
</VirtualHost>
" > subdomain.development.local-ssl.conf
```

Test new configuration

```bash
apachectl configtest
# Syntax OK
```

Enabled site and reload service to load changes in Apache

```bash
a2ensite subdomain.development.local-ssl
service apache2 reload
```

### In development

Need asocciation between IP Address and DNS

```bash
vim /etc/hosts
# On docker
127.0.0.1 subdomain.development.local
# On host machine
127.0.0.1 subdomain.development.local
```

## XDebug

[See](https://medium.com/@jasonterando/debugging-with-visual-studio-code-xdebug-and-docker-on-windows-b63a10b0dec)
or [Remote](https://xdebug.org/docs/remote)

### On docker - Remote

```bash
# Install extension from PECL
sudo pecl install -f xdebug
sudo pecl uninstall xdebug

# Xdebug 2
echo "xdebug.idekey=PHPSTORM
xdebug.remote_mode=req
xdebug.remote_host=localhost
;xdebug.remote_host=host.docker.internal
xdebug.remote_port=9000
xdebug.remote_enable=1
;xdebug.remote_autostart=0; Only by explicit request, see below:
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=0
xdebug.coverage_enable=0
;xdebug.remote_log=/var/www/html/xdebug/xdebug.log
xdebug.file_link_format=xdebug://%f@%l
zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

# Xdebug 3
echo 'xdebug.idekey=PHPSTORM
xdebug.mode=debug
xdebug.start_with_request=trigger
xdebug.client_host=host.docker.internal
;xdebug.client_host=host.docker.internal
xdebug.client_port=9003
;xdebug.log=/var/www/html/xdebug/xdebug.log
xdebug.file_link_format=xdebug://%f@%l
zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

# cat /usr/local/etc/php/conf.d/xdebug.ini
# Restart apache to load changes
service apache2 reload

# Web
# Use to start
# https://development.local/?XDEBUG_SESSION_START=PHPSTORM
# Use to stop
# https://development.local/?XDEBUG_SESSION_STOP=PHPSTORM
# or
# https://addons.mozilla.org/en-GB/firefox/addon/xdebug-helper-for-firefox/

# CLI
# On *nix
export XDEBUG_SESSION=1
export XDEBUG_CONFIG="idekey=PHPSTORM"
# On Windows
set XDEBUG_SESSION=1
set XDEBUG_CONFIG="idekey=PHPSTORM"
# After run
# php -f file.php
```
> https://xdebug.org/docs/compat
> https://pecl.php.net/package/xdebug

> PHP 5.6:  sudo pecl install -f xdebug-2.5.5

> PHP 7.0:  sudo pecl install -f xdebug-2.6.1

> PHP 7.1:  sudo pecl install -f xdebug-2.9.8

> PHP 7.2:  sudo pecl install -f xdebug-3.1.6
> PHP 7.3:  sudo pecl install -f xdebug-3.1.6
> PHP 7.4:  sudo pecl install -f xdebug-3.1.6

> PHP 8.0:  sudo pecl install -f xdebug-3.2.2
> PHP 8.1+: sudo pecl install -f xdebug

### Local

In `php.ini` file add:

```bash
;;;;;;;;;;
; XDebug ;
;;;;;;;;;;

; Xdebug 2
xdebug.remote_enable=1
xdebug.remote_mode=req
xdebug.remote_host=localhost
xdebug.remote_port=9003
xdebug.remote_enable=0
xdebug.remote_autostart=1
xdebug.idekey=PHPSTORM
; To enable profiler use XDEBUG_PROFILE=PHPSTORM in (GET|POST|COOKIE)
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
xdebug.file_link_format=xdebug://%f@%l
zend_extension=/usr/local/lib/php/extensions/xdebug.so

; Xdebug 3
xdebug.idekey=PHPSTORM
xdebug.mode=debug
xdebug.start_with_request=trigger
xdebug.client_host=localhost
xdebug.client_port=9003
;xdebug.log=/var/www/html/xdebug/xdebug_local.log
xdebug.file_link_format=xdebug://%f@%l
zend_extension=/usr/lib/php/20210902/xdebug.so

; Windows
; zend_extension=php_xdebug-{version}.dll
```
> For Windows use php.ini

> For Linux use path: `/etc/php/{vr}/mods-available/xdebug.ini` aka: `vim /etc/php/8.1/mods-available/xdebug.ini`

## PCOV

[See](https://github.com/krakjoe/pcov)

```bash
sudo pecl install -f pcov

echo 'extension=/usr/lib/php/20220829/pcov.so' | sudo tee /etc/php/8.2/mods-available/pcov.ini
echo 'extension=/usr/lib/php/20240924/pcov.so' | sudo tee /etc/php/8.4/mods-available/pcov.ini

sudo phpenmod pcov
sudo phpdismod pcov
```
> PHP 8.4: sudo pecl install -f pcov-1.0.12

## AST

[See](https://github.com/nikic/php-ast)

```bash
sudo pecl install -f ast

echo 'extension=/usr/lib/php/20210902/ast.so' | sudo tee /etc/php/8.1/mods-available/ast.ini

sudo phpenmod ast
sudo phpdismod ast
```

### Troubles

0. E: Could not connect to client. :-(
- Check config in IDE, specialy: port enable
- Check IP in: `xdebug.remote_host`
- Check Port in: `xdebug.remote_port`

0. E: Time-out connecting to client (Waited: 200 ms). :-(
- Start listening in IDE

0. E: Cannot install, php_dir for channel "pecl.php.net" is not writeable by the current user
- Run command as sudo user

0. E: Xdebug requires Zend Engine API version 420210902.
   E: The Zend Engine API version 320190902 which is installed, is outdated.
- Check API `zend_extension` is equals in PHP version, not? Fixed!
    php -i | grep '^Zend Extension =>'
    cat /etc/php/8.2/mods-available/xdebug.ini | grep zend_extension
- Install from package
    sudo apt install php7.4-xdebug
- Set path extension to relative path:
    zend_extension=/usr/lib/php/20210902/xdebug.so -> zend_extension=xdebug.so

0. Check connection from web server to localhost (Editor)
    telnet host.docker.internal 9003

### VSCode

launch.json example for local and remote debugging multiple root

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for XDebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                // Remote (web)
                "/var/www/html/flexphp/flex-generator": "${workspaceFolder:flex-generator}",
                // Local (cli)
                "${workspaceFolder:flex-generator}": "${workspaceFolder:flex-generator}",
                // IMPORTANT: Romote or Local, not both
            },
            "xdebugSettings": {
                "max_data": 65535,
                "show_hidden": 1,
                "max_children": 100,
                "max_depth": 5
            },
            "ignore": ["**/vendor/**/*.php"]
        },
        {
            "name": "Launch currently open script",
            "type": "php",
            "request": "launch",
            "program": "${file}",
            "cwd": "${fileDirname}",
            "port": 9003
        }
    ]
}
```

### Enable/Disable

```bash
# Ubuntu
sudo phpenmod xdebug
sudo phpdismod xdebug

# Docker
# vim /usr/local/etc/php/conf.d/xdebug.ini
; zend_extension=...

# Windows
# php.ini
; zend_extension=...
```

## Profiler

### php-spx

[See](https://github.com/NoiseByNorthwest/php-spx)

```bash
# Install in docker!
sudo apt-get install -y zlib1g-dev
mkdir -p /var/www/html/profiler
git clone --depth=1 --branch=master https://github.com/NoiseByNorthwest/php-spx.git
cd php-spx
phpize
./configure
make
make install

# Enabled
echo "spx.http_enabled=1
spx.http_key="dev"
spx.http_ip_whitelist="172.20.0.100"
extension=$(find /usr/local/lib/php/extensions/ -name spx.so)" > /usr/local/etc/php/conf.d/spx.ini

# Enabled in Apache
service apache2 reload

# Profiler Web
https://development.local/?SPX_KEY=dev&SPX_UI_URI=/
https://development.local/project/?SPX_KEY=dev&SPX_UI_URI=/
https://subdomain.development.local/?SPX_KEY=dev&SPX_UI_URI=/

# Profiler cli
SPX_ENABLED=1 SPX_REPORT=full php bin/console cache:clear
```

### XHProf (and XHGUI)

[See](https://www.alberton.info/profiling_with_xhprof.html)
[See 2](https://inviqa.com/blog/profiling-xhprof)
[See 3](https://www.slideshare.net/postwait/scalable-internet-architecture)

```bash
mkdir -p /var/www/html/xhprof
cd /var/www/html/xhprof
git clone --depth=1 git@github.com:longxinH/xhprof.git
git clone --depth=1 git@github.com:perftools/xhgui.git
git clone --depth=1 git@github.com:perftools/php-profiler.git
```

## SSL Certificate

Load certificate in browser

```
Authorities -> Import -> ssl/certs/ca.cert.pem -> Identify Websites
```
> Upload CA in browser: /var/www/html/freddiegar/services/docker/ssl/ca.cert.pem
> Not exists? check below to generate item

###  On Linux

0. Add in: /etc/hosts

```bash
vim /etc/hosts

127.0.0.1       development.local
::1             development.local
```

1. Add development certificate in trusted certficates in host machine

```bash
sudo cp -p /var/www/ssl/certs/ca.cert.pem /usr/local/share/ca-certificates/development.local.ca-cert.crt
sudo chown root:root /usr/local/share/ca-certificates/development.local.ca-cert.crt
sudo chmod 644 /usr/local/share/ca-certificates/development.local.ca-cert.crt
```

2. Updated certificates

```bash
sudo update-ca-certificates
```

3. Run in cmd to test (a URL valid), for example:

```bash
curl -I https://development.local
```

> It must be return: 200 | 302 | 403 HTTP Code

### On Windows

See: [https://curl.haxx.se/docs/sslcerts.html](https://curl.haxx.se/docs/sslcerts.html)

0. Add in: C:\Windows\System32\drivers\etc\hosts

```bash
127.0.0.1       development.local
::1             development.local
```

1. Download certificate package from: https://curl.haxx.se/docs/caextract.html (save as: `curl-ca-bundle.crt`)

2. Run in cmd (or sh with Git) command:

```bash
openssl s_client -showcerts -servername development.local -connect development.local:443 > development.local.pem
```
> Optional: content is saved in `ssl/development.local.pem` yet.

3. Concat `development.local.pem` chain certificates in `curl-ca-bundle.crt` file.
> Open file `ssl/development.local.pem` and paste content in `curl-ca-bundle.crt`.

4. Move file curl-ca-bundle.crt concatenated to:

```bash
C:/Windows/System32/curl-ca-bundle.crt
```

5. Run in cmd to test (a URL valid), for example:

```bash
curl -I https://development.local
```

> It must be return: 302 | 200 HTTP Code

### Generate

[See](https://lawebdefreddie.blogspot.com/2017/05/crear-certificados-ssl-autofirmados.html)

```bash
# Config file to use in process
export OPENSSL_CONF=/var/www/html/freddiegar/services/docker/ssl/openssl.cnf

mkdir /var/www/ssl
cd /var/www/ssl
mkdir certs crl newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial
openssl genrsa -aes256 -out private/ca.key.pem 4096

# CN: ca.development.local
openssl req -new -x509 -days 3650 -key private/ca.key.pem -sha256 -extensions v3_ca -out certs/ca.cert.pem

# Verification
# openssl x509 -noout -text -in certs/ca.cert.pem

mkdir intermediate
cd /var/www/ssl/intermediate
mkdir certs crl newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial
openssl genrsa -aes256 -out private/intermediate.key.pem 4096

# CN: intermediate.development.local
openssl req -sha256 -new -key private/intermediate.key.pem -out certs/intermediate.csr.pem

cd /var/www/ssl
openssl ca -keyfile private/ca.key.pem -cert certs/ca.cert.pem -extensions v3_ca -notext -md sha256 -in intermediate/certs/intermediate.csr.pem -out intermediate/certs/intermediate.cert.pem

# Verification
# openssl verify -CAfile certs/ca.cert.pem intermediate/certs/intermediate.cert.pem

cat intermediate/certs/intermediate.cert.pem certs/ca.cert.pem > intermediate/certs/ca-chain.cert.pem

cd /var/www/ssl/intermediate
openssl genrsa -out private/development.local.key.pem 2048
chmod 644 private/development.local.key.pem
openssl req -sha256 -new -key private/development.local.key.pem -out certs/development.local.csr.pem

cd /var/www/ssl
openssl ca -keyfile private/ca.key.pem -cert certs/ca.cert.pem -extensions usr_cert -notext -md sha256 -in intermediate/certs/development.local.csr.pem -out intermediate/certs/development.local.cert.pem

# Optional: Lighttpd certificate
# cat intermediate/private/development.local.key.pem intermediate/certs/development.local.cert.pem > intermediate/certs/development.local.lighttpd.pem

find . -type d -exec chmod 755 {} +
find . -type f -exec chmod 644 {} +
chown $USER:$USER . -R
ll /var/www/ssl/intermediate/certs/development.local.cert.pem
ll /var/www/ssl/intermediate/private/development.local.key.pem
ll /var/www/ssl/intermediate/certs/ca-chain.cert.pem
# ll /var/www/ssl/intermediate/certs/development.local.lighttpd.pem

# Copy new files in docker services

cp -p /var/www/ssl/certs/ca.cert.pem /var/www/html/freddiegar/services/docker/ssl/
cp -p /var/www/ssl/intermediate/certs/ca-chain.cert.pem /var/www/html/freddiegar/services/docker/ssl/
cp -p /var/www/ssl/intermediate/certs/development.local.cert.pem /var/www/html/freddiegar/services/docker/ssl/
cp -p /var/www/ssl/intermediate/private/development.local.key.pem /var/www/html/freddiegar/services/docker/ssl/

```
> Upload new CA in browser: /var/www/html/freddiegar/services/docker/ssl/ca.cert.pem

### Re-generate Expired

[See](https://www.golinuxcloud.com/generate-duplicate-certificates-openssl/)

```bash
# Config file to use in process
export OPENSSL_CONF=/var/www/html/freddiegar/services/docker/ssl/openssl.cnf

cp -pr /var/www/ssl /var/www/ssl-backup

cd /var/www/ssl

echo 'unique_subject = no' > index.txt.attr

cd /var/www/ssl/intermediate
echo `expr $(cat serial) + 1` > serial
# N3m!!
openssl genrsa -aes256 -out private/intermediate.key.pem 4096

openssl req -sha256 -new -key private/intermediate.key.pem -out certs/intermediate.csr.pem

cd /var/www/ssl
# N3u!
openssl ca -keyfile private/ca.key.pem -cert certs/ca.cert.pem -extensions v3_ca -notext -md sha256 -in intermediate/certs/intermediate.csr.pem -out intermediate/certs/intermediate.cert.pem

# Verification
# openssl verify -CAfile certs/ca.cert.pem intermediate/certs/intermediate.cert.pem

cat intermediate/certs/intermediate.cert.pem certs/ca.cert.pem > intermediate/certs/ca-chain.cert.pem

cd /var/www/ssl/intermediate
openssl genrsa -out private/development.local.key.pem 2048
chmod 644 private/development.local.key.pem
openssl req -sha256 -new -key private/development.local.key.pem -out certs/development.local.csr.pem

cd /var/www/ssl
openssl ca -keyfile private/ca.key.pem -cert certs/ca.cert.pem -extensions usr_cert -notext -md sha256 -in intermediate/certs/development.local.csr.pem -out intermediate/certs/development.local.cert.pem

# Optional: Lighttpd certificate
# cat intermediate/private/development.local.key.pem intermediate/certs/development.local.cert.pem > intermediate/certs/development.local.lighttpd.pem

find . -type d -exec chmod 755 {} +
find . -type f -exec chmod 644 {} +
chown $USER:$USER . -R

ll /var/www/ssl/intermediate/certs/development.local.cert.pem
ll /var/www/ssl/intermediate/private/development.local.key.pem
ll /var/www/ssl/intermediate/certs/ca-chain.cert.pem
# ll /var/www/ssl/intermediate/certs/development.local.lighttpd.pem

# Copy new files in docker services

cp -p /var/www/ssl/certs/ca.cert.pem /var/www/html/freddiegar/services/docker/ssl/
cp -p /var/www/ssl/intermediate/certs/ca-chain.cert.pem /var/www/html/freddiegar/services/docker/ssl/
cp -p /var/www/ssl/intermediate/certs/development.local.cert.pem /var/www/html/freddiegar/services/docker/ssl/
cp -p /var/www/ssl/intermediate/private/development.local.key.pem /var/www/html/freddiegar/services/docker/ssl/

rm -Rf /var/www/ssl-backup
```
> Upload new CA in browser: /var/www/html/freddiegar/services/docker/ssl/ca.cert.pem

### Update OpenSSL binary

[See](https://askubuntu.com/questions/1102803/how-to-upgrade-openssl-1-1-0-to-1-1-1-in-ubuntu-18-04)
[Vulnerabilities](https://www.openssl.org/news/vulnerabilities-1.1.1.html)
[Releases](https://openssl-library.org/source/)

```bash
# Current version
openssl version
# Future version
cd ~
curl -L https://github.com/openssl/openssl/archive/refs/tags/OpenSSL_1_1_1w.tar.gz -o openssl.tar.gz
tar -zxf openssl.tar.gz
cd openssl*
# Prepare new version
./config && make && make test
# Backup current version, I'm human
sudo mv /usr/bin/openssl /usr/bin/openssl.$(openssl version | cut -d ' ' -f2)
# Deploy version
sudo make install
sudo ln -s /usr/local/bin/openssl /usr/bin/openssl
sudo ldconfig
# Check version
openssl version
# Clean house
cd ~
rm -Rf openssl*
```
> Dependencies require: sudo apt-get install make gcc

## Composer

Test legacy code in PHP

```bash
# Unit Test in  PHP
composer global require phpunit/phpunit
# Fixes PHP
composer global require friendsofphp/php-cs-fixer --dev
# Simulate request from Apache
composer global require jelix/fakeserverconf
```

## Benchmark Web Server

### Apache Bench (ab)

[See](http://www.devside.net/archives/wamp-server/load-testing-apache-with-ab-apache-bench) for examples or
[See](https://httpd.apache.org/docs/2.4/programs/ab.html) for options

```bash
# Install
sudo apt-get install -y apache-utils
# 1 user - 1 page = local
ab -n 1 -c 1 -t 10 -k -l -S -d -q -r -H "Accept-Encoding: gzip, deflate" localhost/
# 1 user - 100 pages = test
ab -n 100 -c 1 -t 10 -k -l -S -d -q -r -H "Accept-Encoding: gzip, deflate" localhost/
# 5 users - 10 pages = production (~50000 hits/month)
ab -n 50 -c 5 -t 10 -k -l -S -d -q -r -H "Accept-Encoding: gzip, deflate" localhost/
# 10 users - 10 pages = production killer (~10 users in same minute :O)
ab -n 100 -c 10 -t 10 -k -l -S -d -q -r -H "Accept-Encoding: gzip, deflate" localhost/
# 30 users - 20 pages = production unicorn (top 1% of sites on internet)
ab -n 600 -c 30 -t 10 -k -l -S -d -q -r -H "Accept-Encoding: gzip, deflate" localhost/
# 90 users - 30 pages = production insane (top 1% of top 1%, really busiest site)
ab -n 2700 -c 90 -t 10 -k -l -S -d -q -r -H "Accept-Encoding: gzip, deflate" localhost/
```
> ab send HTTP 1.0 request and not allowed self-signed certificates

### Siege

[See](https://www.euperia.com/wrote/speed-testing-your-website-with-siege-part-one/) for examples or
[See](https://www.joedog.org/siege-manual/) for options or
[See](https://www.ryadel.com/en/apache-mod_cache-mod_cache_disk-web-site-caching-reverse-proxy/) for ssl

```bash
# Install
sudo apt-get install siege && siege.config
# 1 user - 1 page = local
siege -r1 -c1 -t10s -H "Accept-Encoding: gzip, deflate" localhost/
# 1 user - 100 pages = test
siege -r100 -c1 -t10s -H "Accept-Encoding: gzip, deflate" localhost/
# 5 users - 10 pages = production (~50000 hits/month)
siege -r50 -c5 -t10s -H "Accept-Encoding: gzip, deflate" localhost/
# 10 users - 10 pages = production killer (~10 users in same minute :O)
siege -r100 -c10 -t10s -H "Accept-Encoding: gzip, deflate" localhost/
# 30 users - 20 pages = production unicorn (top 1% of sites on internet)
siege -r600 -c30 -t10s -H "Accept-Encoding: gzip, deflate" localhost/
# 90 users - 30 pages = production insane (top 1% of top 1%, really busiest site)
siege -r2700 -c90 -t10s -H "Accept-Encoding: gzip, deflate" localhost/
```
> siege send HTTP 1.1 request and accept self-signed certificates

### Manual

```bash
i=0; while [ $i -lt 10 ]; do \time -p curl -L -H "Accept-Encoding: gzip, deflate" "http://localhost/" > /dev/null; sleep 1; i=$[$i+1]; done 2>&1 | grep real | awk '{print $2}' | awk '{avg += ($1 - avg) / NR;} END {print "Average: " avg "s";}'
```
> It use 1 second between requests and 10 requests

> time is reserved word (too in zsh) then use \time, more info [here](https://www.howtogeek.com/415977/how-to-use-the-time-command-on-linux/)

## Logger

### Sentry

See [Sentry](https://github.com/getsentry/onpremise) installation from Docker

```bash
cd /var/www
mkdir -p /var/www/logger/
cd /var/www/logger/
git clone --depth=1 git@github.com:getsentry/onpremise.git sentry
cd /var/www/logger/sentry

# Config file
cp -p sentry/config.example.yml sentry/config.yml
cp -p sentry/sentry.conf.example.py sentry/sentry.conf.py

# Change default options
sed -i 's/!!changeme!!/K!eO9PchIOGJ/g' sentry/config.yml

sed -i 's/COMPOSE_PROJECT_NAME=sentry_onpremise/COMPOSE_PROJECT_NAME=logger/g' .env
sed -i 's/SENTRY_EVENT_RETENTION_DAYS=90/SENTRY_EVENT_RETENTION_DAYS=30/g' .env

# Run installation
./install.sh

# After installation
docker-compose up -d

# Go to
http://localhost:9000
```

## PenTesting

See [Kali](https://www.kali.org/news/official-kali-linux-docker-images/) installation from Docker

### XSSer

See [XSSer](https://github.com/epsylon/xsser) and [options](http://lordepsylon.users.sourceforge.net/)

```bash
# Dumy
python3 xsser -all MY_APP_URL
# Basic
python3 xsser -u MY_APP_URL
# Automatic
python3 xsser -u --auto MY_APP_URL
# Example GET
python3 xsser -u 'MY_APP_URL' -g '?PARAM1=XSS'
# Example POST
python3 xsser -u 'MY_APP_URL' -p '?PARAM1=XSS'
```

Updated command

```bash
python3 xsser --update
```

Get `xsser` command in javascript, tap F12 Key in Browser and paste (for POST method):

```javascript
var data = '';
document.querySelectorAll('input, select').forEach(function (input, index) {
  inputName = input.name
  inputType = input.type
  switch (inputType) {
    case 'select-one':
    case 'select-multiple':
      inputValue = input.value;
      if (inputValue === '' && input.options.length > 0) {
        inputValue = input[input.options.length - 1].value;
      }
      break;
    case 'checkbox':
      inputValue = input.value !== '' ? 1 : 0;
      break;
    case 'radio':
      inputValue = document.querySelectorAll('input[name=' + inputName + ']:checked').value
        ? document.querySelectorAll('input[name=' + inputName + ']:checked').value
        : document.querySelectorAll('input[name=' + inputName + ']')[0].value
      break;
    case 'number':
      inputValue = 999;
      break;
    default:
        inputValue = 'text';
      break;
  }
  data = data + (index === 0 ? '' : '&') + inputName + '=' + (!isNaN(parseFloat(inputValue)) && isFinite(inputValue) ? 'XIS' : 'XSS');
});
console.log('python3 xsser --statistics --user-agent="' + navigator.userAgent + '" --cookie="' + document.cookie + '" --retries=1 --reverse-check --url="' + window.location.href.substring(0, (window.location.href.indexOf('?') != -1 ? window.location.href.indexOf('?') : window.location.href.length)) + '" -p "' + data + '" --Xsa > /var/www/html/xsser/XSSer' +  window.location.pathname.replace(/\//g, '_') + '.log && cat /var/www/html/xsser/XSSer' +  window.location.pathname.replace(/\//g, '_') + '.log | egrep "XSS FOUND!"');
```

### XSStrike

See [XSStrike](https://github.com/s0md3v/XSStrike)

```bash
# Basic
python3 xsstrike.py -u MY_APP_URL
# Automatic
python3 xsstrike.py -u --auto MY_APP_URL
# Example GET
python3 xsstrike.py -u 'MY_APP_URL?PARAM1=XSS'
# Example POST
python3 xsstrike.py -u 'MY_APP_URL' --data '?PARAM1=XSS'
```

Updated command

```bash
python3 xsstrike.py --update
```

Get `xsstrike` command in javascript, tap F12 Key in Browser and paste (for POST method):

```javascript
var data = '';
document.querySelectorAll('input, select').forEach(function (input, index) {
  inputName = input.name
  inputType = input.type
  switch (inputType) {
    case 'select-one':
    case 'select-multiple':
      inputValue = input.value;
      if (inputValue === '' && input.options.length > 0) {
        inputValue = input[input.options.length - 1].value;
      }
      break;
    case 'checkbox':
      inputValue = input.value !== '' ? 1 : 0;
      break;
    case 'radio':
      inputValue = document.querySelectorAll('input[name=' + inputName + ']:checked').value
        ? document.querySelectorAll('input[name=' + inputName + ']:checked').value
        : document.querySelectorAll('input[name=' + inputName + ']')[0].value
      break;
    case 'number':
      inputValue = 999;
      break;
    default:
        inputValue = 'text';
      break;
  }
  data = data + (index === 0 ? '' : '&') + inputName + '=query';
});
console.log('python3 xsstrike.py --url="' + window.location.href.substring(0, (window.location.href.indexOf('?') != -1 ? window.location.href.indexOf('?') : window.location.href.length)) + '" --data "' + data + '" > /var/www/html/xsstrike/XSStrike' +  window.location.pathname.replace(/\//g, '_') + '.log && cat /var/www/html/xsstrike/XSStrike' +  window.location.pathname.replace(/\//g, '_') + '.log | egrep "Payload: "');
```

### SQLMap

See [SQLMap](https://www.ma-no.org/en/security/sqlmap-installation-and-usage-in-ubuntu-and-kali-linux)

```bash
python3 sqlmap.py -h
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --banner
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --users
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --users --passwords
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --dbs
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms -D db --tables
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms -D db -T table --columns
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms -D db -T table -C column1,column2 --dump
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --level 5
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --risk 3
python3 sqlmap.py -u MY_APP_URL --batch --dbms=mysql --technique

python3 sqlmap.py -u "MY_APP_URL?PARAM1=1&PARAM2=2" -o --batch --dbms=mysql --forms --keep-alive --threads=3 -v 3 --method=POST
```

Updated command

```bash
python3 sqlmap.py --update
```

Get `sqlmap` command in javascript, tap F12 Key in Browser and paste (for MySQL and POST method):

```javascript
var data = '';
document.querySelectorAll('input, select').forEach(function (input, index) {
  inputName = input.name
  inputType = input.type
  switch (inputType) {
    case 'select-one':
    case 'select-multiple':
      inputValue = input.value;
      if (inputValue === '' && input.options.length > 0) {
        inputValue = input[input.options.length - 1].value;
      }
      break;
    case 'checkbox':
      inputValue = input.value !== '' ? '1' : '0';
      break;
    case 'radio':
      inputValue = document.querySelectorAll('input[name=' + inputName + ']:checked').value
        ? document.querySelectorAll('input[name=' + inputName + ']:checked').value
        : document.querySelectorAll('input[name=' + inputName + ']')[0].value
      break;
    case 'number':
      inputValue = input.value;
      if (inputValue === '') {
        inputValue = Math.floor((Math.random() * 9) + 1);
      }
      break;
    default:
      inputValue = input.value;
      if (inputValue === '') {
        inputValue = 'XD';
      }
      break;
  }
  if (inputValue === '' || inputValue === undefined) {
    console.log(inputName + ' \t : Asignar valor manualmente.');
  }
  data = data + (index === 0 ? '' : '&') + inputName + '=' + encodeURI(inputValue);
});
console.log('python3 sqlmap.py -o --dbms=mysql --keep-alive --threads=3 --method=POST --eta --user-agent="' + navigator.userAgent + '" --cookie="' + document.cookie + '" --url="' + window.location.href + '" --data="' + data + '" --level 1 --risk 3 --flush-session --batch > /var/www/html/sqlmap/SQLMap' +  window.location.pathname.replace(/\//g, '_') + '.log && cat /var/www/html/sqlmap/SQLMap' +  window.location.pathname.replace(/\//g, '_') + '.log | egrep "(.*) is vulnerable"');
```

### ZAP

See [ZAP](https://github.com/Grunny/zap-cli)

Scan baseline

```bash
TARGET=https://development.local/Project/
zap-baseline.py -t $TARGET -d
```

Run ZAP as deamon (in detach mode):

```bash
cd /zap
zap.sh -daemon -host 0.0.0.0 -port 2375 -config api.key=ZAPLocal -config scanner.attackOnStart=true -config view.mode=attack -config connection.dnsTtlSuccessfulQueries=-1 -config api.addrs.addr.name=.* -config api.addrs.addr.regex=true -addonupdate &
```

Scan url XSS (xss) or SQLInjection (sqli)

```bash
TARGET=https://development.local/Project/
zap-cli -p 2375 --api-key ZAPLocal open-url $TARGET
zap-cli -p 2375 --api-key ZAPLocal spider $TARGET
zap-cli -p 2375 --api-key ZAPLocal quick-scan --scanners xss -r $TARGET
# or
# zap-cli --verbose -p 2375  --api-key ZAPLocal quick-scan -s xss --spider -r $TARGET
```

### OpenDoor

See [OpenDoor](https://github.com/stanislav-web/OpenDoor)

```bash
python3 opendoor.py --host MY_APP_URL
```
Updated command

```bash
python3 opendoor.py --update
```

### Commix

See [Commix]( https://github.com/commixproject/commix) and [options](https://github.com/commixproject/commix/wiki)

```bash
# Help
python3 commix.py –-help
# Wizard
python3 commix.py –-wizard
# Dumy
python3 commix.py –url="MY_APP_URL?PARAM1=INJECT_HERE"
# Unix and PHP
python3 commix.py --url "MY_APP_URL?PARAM1=INJECT_HERE" --os=unix --cookie="foo=bar; bar=foo" --hostname --skip-calc --skip-empty --random-agent --os-cmd="date>/var/www/project/logs/commix.log"
```

Updated command

```bash
python3 commix --update
```

## Bootstrap Custom

Clone repo Bootstrap (and npm install for dependencies, of course, you require nodejs installed)

```bash
git clone git@github.com:twbs/bootstrap.git
git checkout v4.3.1 #or another stable version#
```

In bootstrap folder create folder called `sass` and into folder two files: _customVariables.scss and _customRules.scss

```bash
cd bootstrap
mkdir sass
cd sass
touch _customVariables.scss
touch _customRules.scss
```

*_customVariables.scss*: Change variables to override of variables.scss file
*_customRules.scss*: Add extra rules to apply

```css
// _customVariables.scss
$font-family-sans-serif:        Arial, sans-serif !default;
```

```css
// _customRules.scss
.btn {
    text-transform:             uppercase;
}
```
Add extra configuration in `scss/bootstrap.scss` file as import

```css
// bootstrap.scss
// Custom variables (beginning)
@import "../sass/customVariables";

// Bootstrap setup files

// Custom rules (end)
@import "../sass/customRules";

```

Ready, then compile new css files in root folder:

```bash
npm run css
```
