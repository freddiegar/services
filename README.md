Docker Setup
---

## Requisites

- docker
- docker-compose

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
```

### Deploy

Deploy Apache Server with PHP 7.3 (apache73)

```bash
docker-compose up -d
```

### SSL Certificate in Windows

See: (https://curl.haxx.se/docs/sslcerts.html)[https://curl.haxx.se/docs/sslcerts.html]

0. Add in: C:C:\Windows\System32\drivers\etc\hosts

```
127.0.0.1       analitica.local
::1             analitica.local
```

1. Download certificate package from: https://curl.haxx.se/docs/caextract.html (save as: `curl-ca-bundle.crt`)

2. Run in cmd (or sh with Git) command:

```bash
openssl s_client -showcerts -servername server -connect analitica.local:443 > analitica.local.pem
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

See [Kali](https://www.kali.org/news/official-kali-linux-docker-images/) installation from Docker :D

and

See [SQLMap](https://www.ma-no.org/en/security/sqlmap-installation-and-usage-in-ubuntu-and-kali-linux) :P


```bash
python sqlmap.py -h
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --banner
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --users
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --users --passwords
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms --dbs
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms -D db --tables
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms -D db -T table --columns
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --forms -D db -T table -C column1,column2 --dump
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --level 5
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --risk 3
python sqlmap.py -u MY_APP_URL --batch --dbms=mysql --technique

python sqlmap.py -u "MY_APP_URL?PARAM1=1&PARAM2=2" -o --batch --dbms=mysql --forms --keep-alive --threads=3 -v 3 --method=POST
```

Get command `sqlmap` in javascript (for MySQL and POST method):

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
console.log('python sqlmap.py -o --dbms=mysql --keep-alive --threads=3 --method=POST --eta --user-agent="' + navigator.userAgent + '" --cookie="' + document.cookie + '" --url="' + window.location.href + '" --data="' + data + '" --level 1 --risk 3 --flush-session --batch > /var/www/html/sqlmap/SQLMap' +  window.location.pathname.replace(/\//g, '_') + '.log && cat /var/www/html/sqlmap/SQLMap' +  window.location.pathname.replace(/\//g, '_') + '.log | egrep "(.*) is vulnerable"');
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
