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

## Deploy

Install services

```bash
docker-compose up -d SERVICE_NAME
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
docker network connect <network-name> db
docker network connect <network-name> cache
```

## Binding data

Create folders data and log and set defaults

```bash
sudo mkdir -p /var/lib/mysql && sudo chown $(whoami):docker /var/lib/mysql
sudo mkdir -p /var/log/mysql && sudo chown $(whoami):docker /var/log/mysql
touch /var/log/mysql/error.log
touch /var/log/mysql/mysql.log
touch /var/log/mysql/slow.log
chmod 666 /var/log/mysql/*.log
```

## MySQL

Edit configuration file

```bash
docker exec -it db bash
apt update && apt install vim -y
vim /etc/mysql/mysql.conf.d/mysqld.cnf
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

Save logs file:

```bash
[mysqld]

sql-mode                      = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
log_error                     = /var/log/mysql/error.log
general_log                   = 0
general_log_file              = /var/log/mysql/mysql.log
slow_query_log                = 1 # In minutes
slow_query_log_file           = /var/log/mysql/slow.log
long_query_time               = 2 # In minutes
log-queries-not-using-indexes
```

### Memory

- Set memory from server available to use in MySQL:

```bash
[mysqld]

key_buffer_size               = 200MB # 20% of total RAM

innodb_buffer_pool_size       = 1G   # 50% - 70 of total RAM
innodb_log_file_size          = 256M # 25% of innodb_buffer_pool_size
innodb_flush_method           = O_DIRECT # avoid double buffering
innodb_file_per_table         = ON
innodb_stats_on_metadata      = OFF
innodb_buffer_pool_instances  = 1 # or 8 if innodb_buffer_pool_size < 1GB

query_cache_type              = 0
# query_cache_size              = 0 # Deprecated in 5.7.20
skip_name_resolve
```

### Charset

```bash
[client]
default-character-set=utf8

[mysql]
default-character-set=utf8

[mysqld]
# character-set-client-handshake = false #force encoding to uft8
character-set-server=utf8
collation-server=utf8_general_ci

[mysqld_safe]
default-character-set=utf8
```

### Tunning

[See](https://github.com/major/MySQLTuner-perl)

```bash
apt update && apt install curl -y
curl -L https://raw.githubusercontent.com/major/MySQLTuner-perl/master/mysqltuner.pl -o /usr/local/bin/mysqltuner.pl
chmod +x /usr/local/bin/mysqltuner.pl
mysqltuner.pl --host 127.0.0.1
# Updated
# mysqltuner.pl --checkversion --updateversion
```

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
pecl install sqlsrv
# ecl install pdo_sqlsrv
# Enabled
echo "extension=$(find /usr/local/lib/php/extensions/ -name sqlsrv.so)" > /usr/local/etc/php/conf.d/sqlsrv.ini
# cat /usr/local/etc/php/conf.d/sqlsrv.ini
# echo "extension=$(find /usr/local/lib/php/extensions/ -name pdo_sqlsrv.so)" > /usr/local/etc/php/conf.d/pdo_sqlsrv.ini
# Restart apache to load changes
service apache2 reload

```

## XDebug

[See](https://medium.com/@jasonterando/debugging-with-visual-studio-code-xdebug-and-docker-on-windows-b63a10b0dec)
or [Remote](https://xdebug.org/docs/remote)

#### On docker - Remote

```bash
# Install extension from PECL
pecl install -f xdebug \
&& echo "xdebug.idekey=PHPSTORM
xdebug.remote_mode=req
xdebug.remote_host=host.docker.internal
xdebug.remote_port=9000
xdebug.remote_enable=1
;xdebug.remote_autostart=0; Only by explicit request, see below:
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=0
xdebug.coverage_enable=0
;xdebug.remote_log=/var/www/html/xdebug/xdebug.log
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
# export XDEBUG_CONFIG="idekey=PHPSTORM"
# On Windows
# set XDEBUG_CONFIG="idekey=PHPSTORM"
# After run
# php -f file.php
```

> PHP 5.6: pecl install -f xdebug-2.5.5

> PHP 7+: pecl install -f xdebug

#### Local

In php.ini add:

```bash
;;;;;;;;;;
; XDebug ;
;;;;;;;;;;

xdebug.remote_enable = 1
xdebug.remote_mode=req
xdebug.remote_host=localhost
xdebug.remote_port=9000
xdebug.remote_enable=0
xdebug.remote_autostart=1
xdebug.idekey=PHPSTORM
; To enable profiler use XDEBUG_PROFILE=PHPSTORM in (GET|POST|COOKIE)
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
zend_extension=/usr/local/lib/php/extensions/xdebug.xo
; Windows
; zend_extension=php_xdebug-2.9.5-7.3-vc15-nts-x86_64.dll
```

#### Troubles

1. E: Could not connect to client. :-(
- Check config in IDE, specialy: port enable
- Check IP in: `xdebug.remote_host`
- Check Port in: `xdebug.remote_port`

2. E: Time-out connecting to client (Waited: 200 ms). :-(
- Start listening in IDE

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
            "port": 9000,
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
            "port": 9000
        }
    ]
}
```

### SSL Certificate

Load certificate in browser

```
Authorities -> Import -> ssl/ca.cert.pem -> Identify Websites
```

####  On Linux

0. Add in: /etc/hosts

```
vim /etc/hosts
127.0.0.1       development.local
::1             development.local
```

#### On Windows

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

3. Concat `development.local.pem` chain certificates in `curl-ca-bundle.crt` file.

4. Move file curl-ca-bundle.crt concatenated to:

```bash
C:/Windows/System32/curl-ca-bundle.crt
```

5. Run in cmd to test (a URL valid), for example:

```bash
curl -I https://development.local
```

It must be return: 302 | 200 HTTP Code

### Composer

Test legacy code in PHP

```bash
# Unit Test in  PHP
composer global require phpunit/phpunit
# Fixes PHP
composer global require friendsofphp/php-cs-fixer
# Simulate request from Apache
composer global require jelix/fakeserverconf
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
