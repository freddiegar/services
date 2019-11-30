Docker Setup
---

## Requisites

- docker
- docker-compose

## XDebug in docker

[See](https://medium.com/@jasonterando/debugging-with-visual-studio-code-xdebug-and-docker-on-windows-b63a10b0dec)

```bash
# Install extension from PECL
pecl install -f xdebug \
&& echo "xdebug.idekey=PHPSTORM
xdebug.remote_mode=req
xdebug.remote_host=host.docker.internal
xdebug.remote_port=9000
xdebug.remote_enable=1
xdebug.remote_autostart=1
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=0
xdebug.coverage_enable=0
#xdebug.remote_log=/var/www/html/xdebug/xdebug.log
zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini

# cat /usr/local/etc/php/conf.d/xdebug.ini
# Restart apache to load changes
service apache2 reload
```

> PHP 5.6: pecl install -f xdebug-2.5.5
> PHP 7+: pecl install -f xdebug

### VSCode 

launch.json example

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for XDebug",
            "type": "php",
            "request": "launch",
            "port": 9000,
            "log": true,
            "externalConsole": true,
            "pathMappings": {
                "/var/www/html/analitica/Automan/": "${workspaceFolder}/"
            },
            "xdebugSettings": {
                "max_data": 65535,
                "show_hidden": 1,
                "max_children": 100,
                "max_depth": 5
            }
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
## Verify

Verify development network

```bash
# Check if not exist
docker network ls | grep development
# Create network
docker network create --driver=bridge --subnet=172.20.0.0/16 --gateway=172.20.0.1 development
```

### Allow access from another networks segment to containers development network

```bash
# Connect another network in each container and use name over ip
docker network connect <network-name> db
docker network connect <network-name> cache
# Example: docker network connect development db
```

### Deploy

Deploy Apache Server with PHP 7.3 (apache73)

```bash
docker-compose up -d
```

### SSL Certificate in Windows

See: [https://curl.haxx.se/docs/sslcerts.html](https://curl.haxx.se/docs/sslcerts.html)

0. Add in: C:C:\Windows\System32\drivers\etc\hosts

```
127.0.0.1       analitica.local
::1             analitica.local
```

1. Download certificate package from: https://curl.haxx.se/docs/caextract.html (save as: `curl-ca-bundle.crt`)

2. Run in cmd (or sh with Git) command:

```bash
openssl s_client -showcerts -servername analitica.local -connect analitica.local:443 > analitica.local.pem
```

3. Concat `analitica.local.pem` chain certificates in `curl-ca-bundle.crt` file.

4. Move file curl-ca-bundle.crt concatenated to:

```bash
C:/Windows/System32/curl-ca-bundle.crt
```

5. Run in cmd to test (a URL valid), for example:

```bash
curl -I https://analitica.local
```

It must be return: 302 | 200 HTTP Code

## PenTesting

See [Kali](https://www.kali.org/news/official-kali-linux-docker-images/) installation from Docker

### XSSer

See [XSSer](https://github.com/epsylon/xsser) and  [options](http://lordepsylon.users.sourceforge.net/)

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
console.log('python3 xsser --user-agent="' + navigator.userAgent + '" --cookie="' + document.cookie + '" --retries=1 --reverse-check --url="' + window.location.href.substring(0, (window.location.href.indexOf('?') != -1 ? window.location.href.indexOf('?') : window.location.href.length)) + '" -p "' + data + '" --Xsa > /var/www/html/xsser/XSSer' +  window.location.pathname.replace(/\//g, '_') + '.log && cat /var/www/html/xsser/XSSer' +  window.location.pathname.replace(/\//g, '_') + '.log | egrep "XSS FOUND!"');
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
