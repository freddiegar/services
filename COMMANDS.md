UTIL COMMANDS
___

Create database
```mysql
create database homestead charset=utf8;
```

Create user database mysql
```mysql
-- create user homestead@'%' identified by 'password';

-- grant all privileges on homestead.* to 'homestead'@'%' identified by 'password';

-- grant all privileges on homestead.* to 'homestead'@'%' identified by 'password' with grant option;

flush privileges;
```

Set password in MySQL (5.6 +)
```mysql
set password for 'homestead'@'%' = PASSWORD('password');

flush privileges;
```

Revoke permissions database mysql
```mysql
-- Show grants
show grants for homestead@'%';

-- Specific
- revoke insert, update on homestead.* from homestead@'%';

-- All except grant option
- revoke all on homestead.* from homestead@'%';

-- All
- revoke all, grant option on homestead.* from homestead@'%';

flush privileges;
```

Check status repository
```bash
security-checker security:check composer.lock
```

Assign permissions in folder
```bash
sudo find /var/www/project -type d -exec chmod 755 {} +
```

Assign permissions in files
```bash
sudo find /var/www/project -type f -exec chmod 644 {} +
```

Assign owners in folder
```bash
sudo find /var/www/project -type d -exec chown user:www-data {} +
```

Assign owners in files
```bash
sudo find /var/www/project -type f -exec chown user:www-data {} +
```

Assign owners in storage folder
```bash
sudo find /var/www/project/storage -type f -exec chmod 664 {} +
```

Keep permission in copy folder
```bash
cp -pRf /from /to
```

Find by content file in folder
```bash
grep -i -H -r "content" ~/folder | cut -d: -f1
```

Diff in COMMIT
```bash
git show --color --pretty=format:%b $COMMIT
```

Diff in staged changes
```bash
git diff --cached
```

Reset (unstage) with lost changes
```bash
git reset --soft HEAD^
```

Reset add (unstage) from all files
```bash
git reset HEAD~
# Updated files, after
git add .
git commit --no-edit -C ORIG_HEAD
```

Reset add (unstage) from one file
```bash
git reset HEAD <path_to_file>
```

Reset changes in file
```bash
git checkout <path_to_file>
```

Reset ALL files in repository
```bash
git checkout -- .
```

Create brach and use it
```bash
git checkout -b <new-branch>
```

Move to branch
```bash
git checkout <new-branch>
```

Save changes in stash branch
```bash
git stash
```

Apply change from stash
```bash
git stash apply -- by default is newer
git stash apply stash@{0}
```

Delete stash
```bash
git stash drop stash@{0}
git stash clear -- Delete all in stash
```

Create tag
```bash
git tag -a v1.0 -m "This is new version v1.0"
```

Delete branch
```bash
git branch -d name-branch
```

Push all tags from repository
```bash
git push --tag
```

Delete tags localy
```bash
git tag --delete v3.0.0
```

Delete tags remote
```bash
git push --delete origin v3.0.0
```

Create snapshot
```bash
vagrant snapshot save NAME
```

Apply snapshot
```bash
vagrant snapshot restore NAME
```

Delete snapshot
```bash
vagrant snapshot delete NAME
```

Setup datetime
```bash
sudo dpkg-reconfigure tzdata
```

Copy from local to server by SSH
```bash
scp filename.ext user@server:/var/www/html/sites
```

Copy from server to local by SSH
```bash
scp user@server:/var/www/html/sites/filename.ext .
```

Copy all content folder local to server by ssh
```bash
scp -r public/apidoc user@server:/var/www/html/sites/public/.
```

Copy by SSH using password, it need
```bash
# sudo apt-get install -y sshpass
sshpass -p "password" scp filename.ext user@server:/var/www/html/sites
# or
sshpass -f "/file/with/password" scp filename.ext user@server:/var/www/html/sites
```

Copy from container to host in docker
```bash
docker cp <containerId>:/from/container /to/host
# docker cp 9614ab82cd55:/tmp/dump_ts_tables.sql /home/user/.
```

Connect containers to network (Ping between container in diff networks)
```bash
docker run --net=<network-name> ...
# or
docker network connect <network-name> <container-name>
```

Unzip "gz" file
```bash
gunzip -k project.sql.gz
```

Load data from file in MySQL
```bash
mysql -u project -p project < project.sql
```

Set string in sha256 in MySQL
```bash
update user set password = sha2('password',0) where username = 'user';
```

Log queries laravel in Connection file method runQueryCallback
```php
if (
            env('APP_DEBUG_SQL') == strtolower('true')
            && strpos($query, 'sqlite_master') === false
            && strpos($query, 'migrations') === false
            && strpos($query, 'foreign key(') === false
            && strpos($query, 'create unique') === false
            && strpos($query, 'create index') === false
            && strpos($query, 'drop table ') === false
        ) {
            file_put_contents('/var/www/log/query.log',print_r(vsprintf(str_replace(['"', '?'], ['', "'%s'"], $query),array_map(function($binding) {return str_replace('\\','\\\\',$binding);}, $bindings)), true) . "\n\n", FILE_APPEND);
            file_put_contents('/var/www/log/query.log',print_r(customizeTrace((new Exception())->getTrace(), 3), true) . "\n\n", FILE_APPEND);
        }
```

Exceptions
```php
file_put_contents('/var/www/log/query.log',print_r($e->getMessage(), true) . "\n\n", FILE_APPEND);
```

Debug events in Lumen in HasEvents.php fireModelEvent method
```php
if (env('APP_DEBUG_EVENT') == strtolower('true')){
    ll(__METHOD__ . ' ' . $event);
}
```

log.php in autoload.php
```php
file_put_contents('/var/www/log/query.log', '');
```

Add origin in git exists repository
```bash
git remote add origin git@github.com:user/name.git
git branch -M main
git push -u origin main
```

Add origin in git repository
```bash
git remote add origin git@github.com:user/name.git
git remote -v
```

Add origin in bitbucket repository
```bash
git remote add origin git@bitbucket.org:project/name.git
git remote -v
```

Change origin in git repository
```bash
git remote remove origin
git remote add origin git@github.org:owner/repository.git
git remote -v
```

Add to ignore in coverage
```php
/**
 * @codeCoverageIgnore
 */
class XYZ {
    /**
     * @codeCoverageIgnore
     */
    function ABC{
        @codeCoverageIgnoreStart
        return true;
        @codeCoverageIgnoreEnd
    }
}
```

Generate docs with apidocs
```bash
./node_modules/apidoc/bin/apidoc -i ./resources/docs/ -o ./public/apidoc/ -f ".*\\.php$"
```

Concat files in folder, in folder
```bash
cat * > merged-file
```

Clear cache Yii
```bash
php yii cache/flush-all
```

App environment in Yii, in Terminal Linux run
```bash
APPLICATION_ENV="dev"
export APPLICATION_ENV
APPLICATION_DEBUG="TRUE"
export APPLICATION_DEBUG
```

Clear file in terminal
```bash
: > storage/logs/laravel.log
```

Permission repository Laravel
```bash
cd /var/www/html/sites/git pull origin master
composer update
composer dump-autoload
php artisan clear-compiled
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear
php artisan queue:restart
find . -path ./vendor -prune -o -type d -exec chown user:www-data {} +
find . -path ./vendor -prune -o -type f -exec chown user:www-data {} +
find . -path ./vendor -prune -o -type d -exec chmod 755 {} +
find . -path ./vendor -prune -o -type f -exec chmod 644 {} +
find ./storage ! -name ".gitignore" -type d -exec chmod 775 {} +
chmod 664 storage/logs/laravel.log
```

Install ServerAgent in jMeter
```bash
cd ~
wget https://github.com/undera/perfmon-agent/releases/download/2.2.3/ServerAgent-2.2.3.zip
unzip ServerAgent-2.2.3.zip -d .
./ServerAgent-2.2.3/startAgent.sh --udp-port 0 --auto-shutdown
```

RabbitMQ # Add sudo when its required
```bash
# Clear Queue
rabbitmqctl purge_queue queue_name
# List Queue
rabbitmqctl list_queues name messages messages_ready messages_unacknowledged
```

MySQL
```mysql
CREATE DATABASE database;
CREATE USER database@'%' IDENTIFIED BY 'XZsAwq1234$%!';
# > 5.7
update mysql.user set Plugin='mysql_native_password' where User = 'database';
GRANT ALL PRIVILEGES ON database.* TO database@'%';
GRANT SELECT ON information_schemas.* TO database@'%';
FLUSH PRIVILEGES;
```

Install Java
```bash
# Add repository
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
# Install
sudo apt-get install oracle-java8-installer
# Verify if install oracle-java8-set-default, if not install
sudo apt-get install oracle-java8-set-default
# Uninstall
sudo apt-get remove --purge oracle-java8-installer
# Clean installation
sudo apt-get autoremove
# Set java version when exist more at once installed
sudo update-alternatives --config java
```

WARNING:
Not install java9, it not is stable!


On Fatal: And branch 'develop' may be fast-forwarded.
```bash
git checkout develop
git pull origin develop
git pull origin develop
git flow feature rebase core-743 # Check merge
#vendor/bin/phpunit # Not broken
#composer run phpcs && composer run phpstan && composer run phpunit
composer test
git flow feature finish core-743
```

Test in Docker PHP in 7.1
```bash
docker run -it --rm --volume=/var/www:/var/www --workdir="/var/www" --name pipelines -entrypoint="/bin/sh" php:7.1-alpine sh
```

Boot from USB in VirtualBox
```bash
# @link: http://openfoamwiki.net/index.php/Installation/Outdated/USB-Stick#How_to_boot_the_USB-Stick_in_a_VirtualBox.3F
# Connect USB
# df -h list name from USB, this example is: /dev/sda
# rm ~/VirtualBox\ VMs/windows/usb.vmdk
sudo VBoxManage internalcommands createrawvmdk -filename ~/VirtualBox\ VMs/windows/usb.vmdk -rawdisk /dev/sda -relative
sudo chown `whoami`:`whoami` ~/VirtualBox\ VMs/windows/usb.vmdk
sudo chmod 666 ~/VirtualBox\ VMs/windows/usb.vmdk
sudo chmod 666 /dev/sda
# Create VM and add new HD choosing one exist: usb.vmdk
```

Find in all files in path
```bash
grep -rF pattern /folder
```

Generate SSH Key (Default bits are 2048)
```bash
ssh-keygen -t rsa -b 4096
```

Autenticate using SSH Key from another ubication
```bash
ssh -i /home/user/.ssh/id_rsa_old user@server.com
```

Using many SSH keys
```bash
echo 'Host one.server.com
IdentityFile ~/.ssh/host_one_key

Host other.server.com
IdentityFile ~/.ssh/host_two_key
' > ~/.ssh/config

chmod g-w ~/.ssh/config
```

Enable SSH Key in Droplet
```bash
### https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04
### Create user
adduser freddie

## Set user sudo
usermod -aG sudo freddie

## Create ssh (if you dont have ssh), in host machine
ssh-keygen

## Register SSH key
# In Host, copy output from
cat ~/.ssh/id_rsa.pub
# In server
su - freddie
mkdir ~/.ssh
chmod 700 ~/.ssh
vim ~/.ssh/authorized_keys # Paste content in clipboard
chmod 600 ~/.ssh/authorized_keys
```

Disable password authentication in Droplet
```bash
sudo vim /etc/ssh/sshd_config
# Setup
PasswordAuthentication no
PubkeyAuthentication yes
ChallengeResponseAuthentication yes
# Apply changes
sudo systemctl reload sshd
```

Find function without typehint return (RegEx)
```bash
function ([^(__)]().*)\)$
function ([^(__|index|create|update|edit|destroy|up|down)]().*)\)$
function ([^(__|index|create|update|edit|destroy|up|down|handle|boot)]().*)\)$
```

Clear cache file in git
```bash
git rm --cached --force ".env.testing"
```

-- MySQL dump
```bash
mysqldump --opt -u[user_name] -p [database_name] | gzip > [backup_file].sql.gz
```

MySQL dump from container
```bash
mysqldump --opt -u[user_name] -p [database_name] | gzip > [backup_file].sql.gz
docker cp [container]:/path/in/container /path/in/host
```

MySQL dump restore
```bash
gunzip -k [backup_file].sql.gz
mysql -u[user_name] -p [database_name] < [backup_file].sql
```

File large size list
```bash
du -cks * | sort -rn | head
```

File large size list
```bash
du -cksh * | sort -rn | head
du -cksh * | sort -rn | head -10 # First 10
```

Dicrectory size
```bash
du -ch .
du -cksh .
```

Add ACL (u=user , g=group)
```bash
sudo setfacl -dR -m [u]:[username]:rwX [/path/file]
sudo setfacl -R -m [u]:[username]:rwX [/path/file]
```

Remove ACL (u=user , g=group)
```bash
sudo setfacl -dR -x [u]:[username] [/path/file]
sudo setfacl -R -x [u]:[username] [/path/file]
```

Remove default ACL
```bash
sudo setfacl -k [/path/file]
```

Read .env from Makefile, put in header Makefile this
```bash
include .env

VARS:=$(shell sed -ne 's/ *\#.*$$//; /./ s/=.*$$// p' .env )
$(foreach v,$(VARS),$(eval $(shell echo export $(v)="$($(v))")))
```

Create new branch from working directory
```bash
svn copy --parents http://subversion.server.com:8023/project \
http://subversion.server.com:8023/project/branches/look-and-feel-bs \
-m "Commit message" --no-auth-cache
```

Switch between branches
```bash
svn switch http://subversion.server.com:8023/project/branches/look-and-feel-bs --no-auth-cache
# return
svn switch http://subversion.server.com:8023/project --no-auth-cache
```

Show current branch
```bash
svn info | grep URL
```

Show modified files only (I: Ignore, M: Modified)
```bash
svn status | grep ^I
```

Show revisions elegible
```bash
svn mergeinfo http://subversion.server.com:8023/project  --no-auth-cache --show-revs eligible
```

Review merge
```bash
svn merge --dry-run -c#### http://subversion.server.com:8023/project  --no-auth-cache
```

Sincronize specific revision
```bash
svn merge -c#### http://subversion.server.com:8023/project  --no-auth-cache
```

Add files ignoring files in control yet
```bash
svn add PATH_SPECIFIED
svn add PATH --force
```

Delete branch
```bash
svn delete http://subversion.server.com:8023/project/branches/look-and-feel-bs \
-m "Delete branch" --no-auth-cache
```

Run AST infection test
- 1st Install: composer global require infection/infection
- 2nd Into project root folder run:
```bash
infection --threads=$(nproc)
# infection -j=$(nproc)
```

Ignore polifyll in composer, add in composer.json
```json
"replace": {
    "symfony/polyfill-ctype": "*",
    "ralouphie/getallheaders": "*",
    "symfony/polyfill-mbstring": "*"
},
```

and run:
```bash
composer update --lock
```

Verify extension required in PHP
```bash
php -m | grep 'curl\|xsl\|shmop\|imap\|zip\|openssl\|mysql\|gd\|mbstring\|soap'
```

RegExp email (PHP)
```
/^[^\W][A-Z0-9._+-]*[^\W][+]?@[^\W][A-Z0-9-]*(\.[A-Z]{1,})+$/i ~= FILTER_VALIDATE_EMAIL
```

RegExp email (MySQL)
```
^[A-Z0-9._+-]*[^[:space:][:blank:].][+]?@[^[:space:][:blank:]_][A-Z0-9-]*(\\.[A-Z]{1,})+$ ~= RegExp email (PHP)
```

Add user to group
```bash
gpasswd -a -G group user
```

Delete group of user
```bash
gpasswd -d user group
```

Mount disk
```bash
# Show disk available
fdisk -l
## mkdir /folder/mount
# mount /path/disk /folder/mount
## auto-mount after restart machine
## check type format /path/disk
# parted -l
vim /etc/fstab
/path/disk /folder/mount ext4 defaults 1 2
```

Update packages in Linux
```bash
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo reboot
```

Repair and optimize all database in MySQL
```bash
mysqlcheck --auto-repair -o --all-databases
# mysqlcheck --auto-repair -o -B dabase-name
```

Size tables in MySQL
```bash
SELECT
  TABLE_NAME AS `Table`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024) AS `Size (KB)`,
  (DATA_LENGTH + INDEX_LENGTH) AS `Size (B)`
FROM
  information_schema.TABLES
WHERE
    TABLE_SCHEMA = 'bookstore'
--   AND
--    TABLE_NAME = 'book'
ORDER BY
  (DATA_LENGTH + INDEX_LENGTH)
DESC;
```

Update node (nodejs)
```bash
npm cache clean -f
npm install -g n
n stable
# node -v
# Windows OS
# Download msi file from: https://nodejs.org/en/download/
```

Update npm
```bash
npm install npm@latest -g
# npm -v
# Windows OS
# On PowerShell
# Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
# > npm-windows-upgrade
```

Install webpack with babel
```bash
# if new npm init -y
# in package.json
  "jest": {
    "transform": {
        "(.*)\\.(js)$": "<rootDir>/node_modules/babel-jest"
    }
  },
  "scripts": {
    "watch": "webpack --watch --mode development",
    "build": "webpack --mode production",
    "test": "jest"
  },
npm install webpack --save-dev
npm install webpack-cli --save-dev
npm install @babel/core --save-dev
npm install @babel/preset-env --save-dev
npm install babel-loader --save-dev
npm install babel-jest --save-dev
echo "{
  'presets': ['@babel/preset-env']
}
" >> .babelrc
echo "const path = require('path');

const config = {
    entry: './src/js/index.js',
    output: {
        path: path.resolve(__dirname, 'public/assets/js'),
        filename: 'bundle.js',
    },
    resolve: {
        modules: [__dirname, 'node_modules'],
        extensions: ['.js'],
    },
    module: {
        rules: [
            {
                test: /\.m?js$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ['@babel/preset-env']
                    }
                }
            }
        ]
    }
};

module.exports = config;
" >> webpack.config.js

# after create js files and:
npm run build
```

Fix repo in svn corrupt, in repo folder root run
```bash
sqlite3 .svn/wc.db "delete from work_queue" && svn cleanup
```

Install Latest Apache (2.4.43) on CentOS
```bash
cd ~
cp -pR /etc/httpd ~/httpd
sudo yum remove -y httpd
sudo yum remove -y httpd-tools
sudo rm -f /etc/yum.repos.d/codeit.mainline.el7.repo
sudo yum install -y rpm-build gcc
sudo yum install -y autoconf zlib-devel libselinux-devel libuuid-devel apr-devel apr-util-devel pcre-devel openldap-devel lua-devel libxml2-devel openssl-devel
sudo yum install -y libtool doxygen

yum info apr | grep Version
yum info apr-devel | grep Version
yum info apr-util-devel | grep Version
# Si son diferentes las versiones compilar la version apr adecuada
sudo yum remove -y apr
wget https://archive.apache.org/dist/apr/apr-1.5.2.tar.bz2
rpmbuild -ts apr-1.5.2.tar.bz2
rpmbuild -tb apr-1.5.2.tar.bz2
sudo rpm -U rpmbuild/RPMS/x86_64/apr-1.5.2-1.x86_64.rpm
sudo rpm -U rpmbuild/RPMS/x86_64/apr-devel-1.5.2-1.x86_64.rpm
sudo yum install -y apr-util-devel
yum info apr | grep Version
yum info apr-devel | grep Version
yum info apr-util-devel | grep Version
rm -Rf apr-1.5.2.tar.bz2 rpmbuild/

wget https://downloads.apache.org//httpd/httpd-2.4.43.tar.bz2
rpmbuild -ts httpd-2.4.43.tar.bz2
rpmbuild -tb httpd-2.4.43.tar.bz2
sudo rpm -U rpmbuild/RPMS/x86_64/httpd-2.4.43-1.x86_64.rpm
sudo rpm -U rpmbuild/RPMS/x86_64/mod_ssl-2.4.43-1.x86_64.rpm
sudo rpm -U rpmbuild/RPMS/x86_64/httpd-tools-2.4.43-1.x86_64.rpm
sudo rpm -U rpmbuild/RPMS/x86_64/mod_lua-2.4.43-1.x86_64.rpm
sudo rpm -U rpmbuild/RPMS/x86_64/mod_proxy_html-2.4.43-1.x86_64.rpm
sudo rpm -U rpmbuild/RPMS/x86_64/httpd-debuginfo-2.4.43-1.x86_64.rpm
httpd -v
rm -Rf httpd-2.4.43.tar.bz2 rpmbuild/

sudo yum remove -y libtool doxygen
sudo yum remove -y autoconf zlib-devel libselinux-devel libuuid-devel apr-devel apr-util-devel pcre-devel openldap-devel lua-devel libxml2-devel openssl-devel
sudo yum remove -y rpm-build gcc
sudo yum autoremove -y

cp -pR /etc/httpd ~/httpd_2_4_43
cp -pR /etc/httpd ~/httpd_alex
sudo rm -Rf /etc/httpd
sudo cp -pR ~/httpd /etc/
cd /etc/httpd
ln -s /var/run run
```

Install PHP 7.4.7 as FPM (FastCGI Process Manager) in Centos7 with Apache
```bash
sudo vim /etc/httpd/conf/httpd.conf
# Remove line
# PhpIniDir ...

sudo yum install epel-release yum-utils -y
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php74
sudo yum clean all
sudo yum install -y php74
sudo yum install -y php-cli
sudo yum install -y php-gd
sudo yum install -y php-imap
sudo yum install -y php-mbstring
sudo yum install -y php-mysqlnd
sudo yum install -y php-pdo
sudo yum install -y php-zip
sudo yum install -y php-soap
sudo yum install -y php-xml
sudo yum install -y php-curl
sudo yum install -y php-opcache
sudo yum install -y php-fpm

sudo vim /etc/php.ini
cgi.fix_pathinfo=1 => cgi.fix_pathinfo=0

sudo vim /etc/php-fpm.d/www.conf
;listen = 127.0.0.1:9000 => listen = /var/run/php-fpm/default.sock
;listen.owner = nobody    => listen.owner = apache
;listen.group = nobody    => listen.group = apache
;listen.group = nobody    => listen.group = apache
;listen.mode = 0660       => listen.mode = 0660

sudo systemctl enable php-fpm
sudo systemctl start php-fpm
sudo systemctl restart httpd.service

# References
# https://www.linuxtechi.com/install-php-7-centos-7-rhel-7-server/
# https://www.stephenrlang.com/2018/02/centos-7-apache-2-4-with-php-fpm/
```

Update docker container from images
```bash
# PHP
docker images | grep php
# php                     7.4-apache          7a935726473b        7 weeks ago         414MB
docker pull php:7.4-apache
docker stop apache74
docker rm apache74
docker-compose up -d --build apache74
# or docker build --name apache74
# php                     7.4-apache          d112b0774835        5 days ago          414MB
docker rmi 7a935726473b

# MySQL
docker images | grep mysql
# mysql  5.7         db39680b63ac   8 months ago   437MB
docker pull mysql:5.7
docker stop db
docker rm db
docker build --name db
# or docker-compose up -d --build db
# mysql  5.7         718a6da099d8   4 weeks ago    448MB
docker rmi db39680b63ac
```

Active/Inactive user account (CentOS)
```bash
# Status
sudo chage -l [username]
# Active: No expire
sudo chage -E-1 [username]
# Disable password aging
sudo chage -I -1 -m 0 -M 99999 -E -1 [username]
# Active: Until
sudo chage -E "2020-12-31" [username]
# Inactive: Expired
sudo chage -E0 [username]
# or: sudo usermod -s /sbin/nologin [username]
```

Allow httpd read/write content in Centos (SELinux)
```bash
ls -lZ /another/path/temp
# Has httpd_sys_rw_content_t?
sudo semanage fcontext -a -t httpd_sys_rw_content_t "/another/path/temp(/.*)?"
# sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html(/.*)?"
sudo restorecon -Rv /another/path/temp
# @see https://www.serverlab.ca/tutorials/linux/web-servers-linux/configuring-selinux-policies-for-apache-web-servers/
```

Find files and folder where owner NOT is [username]
```bash
# owner NOT is [username]
find -L /var/www/html \! -type l \! -user [username] -ls
# owner is [username]
find -L /var/www/html \! -type l -user [username] -ls
# (G)roups has permission to erite
find -L /var/www/html \! -type l -perm /g=w -ls
# (O)thers has permission to erite
find -L /var/www/html \! -type l -perm /o=w -ls
```

Apply actions in find
```bash
# Remove write to group
find -L /var/www -group apache -perm /g=w -print | xargs chmod g-w
```

Add repository from local path in composer. [See](https://getcomposer.org/doc/05-repositories.md#path)
```bash
    ...
    "repositories": [
        {
            "type": "path",
            "url": "../name/repo"
        }
    ],
  ...
```

Connect email provider account with PHP
```php
# Gmail
imap_open('{pop.gmail.com:995/pop3/ssl/novalidate-cert}INBOX', 'account@email.com', 'password');
# or imap_open('{imap.gmail.com:993/imap/ssl}INBOX', 'account@email.com', 'password');

# enable: https://myaccount.google.com/u/1/lesssecureapps
# and enable IMAP options: Gmail -> Settings -> Forwarding and POP/IMAP -> Enabled POP and IMAP options
```

Preload Files in PHP 7.4+
```bash
# for Symfony 5.1+
opcache.preload=/app/var/cache/prod/App_KernelProdContainer.preload.php
# for Symfony 4.4
opcache.preload=/app/var/cache/prod/srcApp_KernelProdContainer.preload.php
```

PDF in PHP
```php
$pdf = new PDF('P', 'pt', 'letter');
$pdf->AddPage();
$pdf->SetAutoPageBreak(false);
// $pdf->AddGrid(10, 10, 594, 770, 10);
$pdf->SetFont('Arial', '', 5);
...
// $pdf->Text(X, Y, string);
$pdf->Text(70, 125, $foo);
$pdf->Text(335, 125, $bar);
...
$pdf->Output('output.fpdf', 'F');
```

Enable grid in fpdf
```php
$pdf->AddGrid(10, 10, 594, 770, 10);

class MyFPDF extends FPDF
{
    ...

    public function AddGrid($x1, $y1, $x2, $y2, $Dist = 8)
    {
        $this->AddGridRow($x1, $y1, $x2);
        $this->AddGridRow($x1, $y2, $x2);
        $this->AddGridColumn($x1, $y1, $y2);
        $this->AddGridColumn($x2, $y1, $y2);

        $NoHorz = ($y2 - $y1) / $Dist ;
        $NoVert = ($x2 - $x1) / $Dist ;

        for ($i = 1; $i < $NoHorz; $i++) {
            $this->AddGridRow($x1, $y1 + ($i * $Dist), $x2);
        }

        for ($i = 1; $i < $NoVert; $i++) {
            $this->AddGridColumn($x1 + ($i * $Dist), $y1, $y2);
        }
    }

    public function AddGridRow($x1, $y, $x2)
    {
        $this->SetFont('Courier', '', 5);
        $this->Line($x1, $y, $x2, $y);
        $this->Text($x1 - (strlen((string)$y) * 3) - 1.5, $y + 1.5, $y);
        $this->Text($x2 + 1.5, $y + 1.5, $y);
    }

    public function AddGridColumn($x, $y1, $y2)
    {
        $this->SetFont('Courier', '', 5);
        $this->Line($x, $y1, $x, $y2);
        $this->Text($x - (strlen((string)$x) * 1.5), $y1 - 2, $x);
        $this->Text($x - 3, $y2 + 5.5, $x);
    }
}
```

Add background in PDF documents using PHP
```php
# apt-get install pdftk
# file.fpdf is a file filled with coordinate using fpdf tool
$fileInput = 'file.fpdf';
$fileTemplate = 'template.pdf';
$fileOutput = 'file.pdf';

$response = [];
$command = sprintf(
    '/usr/bin/pdftk %s background %s output %s 2>&1',
    escapeshellarg($fileInput),
    escapeshellarg($fileTemplate),
    escapeshellarg($fileOutput)
);

exec($command, $response, $codeStatus);
```

Merge PDF documents using PHP
```php
# apt-get install pdftk
$fileInput1 = 'file1.pdf';
$fileInput2 = 'file2.pdf';
$fileOutput = 'file.pdf';

$response = [];
$command = sprintf(
    '/usr/bin/pdftk %s %s cat output %s 2>&1',
    escapeshellarg($fileInput1),
    escapeshellarg($fileInput2),
    escapeshellarg($fileOutput)
);

exec($command, $response, $codeStatus);
```

XSLT Transform in PHP
```php
libxml_use_internal_errors(true);

$xslfile = 'file.xlst';
$xsldata = file_get_contents($xslfile);

$doc = new DOMDocument();
$xsl = new XSLTProcessor();

if (!$doc->loadXML($xsldata, LIBXML_PARSEHUGE)) {
    die('Error: XSLT data');
}

if (!empty($xslfile)) {
  $doc->documentURI = $xslfile;
}

$xsl->importStyleSheet($doc);

if (!is_null($parameters)) {
  $xsl->setParameter('http://namespaces/', $parameters);
}

if (empty($xmldata)) {
  die('Error: Empty XML data');
}

if (!$doc->loadXML($xmldata, LIBXML_PARSEHUGE)) {
  die('Error: XML data');
}

$html = @$xsl->transformToXML($doc);

unset($doc, $xsl);

if ($html === false) {
  die('Error: Empty transform');
}

libxml_use_internal_errors(false);

echo $html;
```

UTF-8 Charset [See](https://www.toptal.com/php/a-utf-8-primer-for-php-and-mysql)
```bash
# PHP
# > php.ini: Affected content type headers
default_charset = "utf-8"
# Custom responses in PHP source code
header('Content-Type: text/html; charset=utf-8');
# Custom strings
htmlspecialchars($str, ENT_NOQUOTES, "UTF-8");
htmlentities($str, ENT_NOQUOTES, "UTF-8");
# MySQL Connection
$conn = mysql_connect('localhost', 'user', 'password');
mysqli_set_charset('utf8', $conn);
# MySQL Connection Symfony, in .env file
DATABASE_URL=mysql://dbuser:dbpassword@dbhost:dbport/dbname?charset=utf8
# Using XML files
<?xml version="1.0" encoding="UTF-8"?>
# Strip UTF-8 characters not allowed in XML content
function utf8_for_xml($string)
{
    return preg_replace('/[^\x{0009}\x{000a}\x{000d}\x{0020}-\x{D7FF}\x{E000}-\x{FFFD}]+/u', ' ', $string);
}
# Specify UTF-8 as the character set for all HTML content
# HTML Content
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
# HTML Forms
<form accept-charset="utf-8">
# In Symfony Forms (Twig)


# MySQL Configuration
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

Dump MySQL many databases
```bash
DATETIME=`date +"%Y%m%d%H%M"`
DBNAMES="db1 db2 ... dbn"

for DBNAME in $DBNAMES
do
    mysqldump -P3306 --opt -uroot -p -c --default-character-set=utf8 ${DBNAME} > /var/mysqldump/${DBNAME}_${DATETIME}.sql
    gzip /var/mysqldump/${DBNAME}_${DATETIME}.sql
    # Decompress
    # gzip -d /var/mysqldump/${DBNAME}_${DATETIME}.sql.gz
done

# OR

echo '#!/bin/bash
echo "Do you want continue with dump? (y/N)"

read RESPONSE

if [ "$RESPONSE" != "y" ]; then
    echo "Dump canceled!"
    exit
fi

databases="db1 db2 dbn"

for database in $databases
do
mysqldump -h 172.20.0.10 --opt -uroot -p $database | gzip > ~/MYSQLDUMPS/${database}_`date +"%Y%m%d" -u`.sql.gz
echo Dump $database done.
done
' > ~/mysqldump.sh
```

Restore dump MySQL many databases
```bash
# _mysqlrestore.sh
DATETIME=$1
DBNAMES="db1 db2 ... dbn"

for DBNAME in $DBNAMES
do
    if [ -f ${DBNAME}.bak ]
    then
        echo "Skiping $DBNAME file"
        continue
    fi
    mysql -P3306 -uroot -p ${DBNAME} < /var/mysqldump/${DBNAME}_${DATETIME}.sql
done

# OR

echo '#!/bin/bash
echo "WARNING: Do you want continue with restore? (y/N)"

read RESPONSE

if [ "$RESPONSE" != "y" ]; then
    echo "Restore canceled!"
    exit
fi

databases="db1 db2 dbn"

for database in $databases
do
mysql -h 172.20.0.10 -uroot -p -e "drop database if exists ${database};create database ${database} charset utf8;" 2>/dev/null
zcat ~/MYSQLDUMPS/${database}_`date +"%Y%m%d" -u`.sql.gz | mysql -h 172.20.0.10 -uroot -p $database 2>/dev/null
echo Restore $database done.
done
' > ~/mysqlrestore.sh
```

Install GPG v1
```bash
apt-get install -y gpgv1
```

Install cron in docker container
```bash
apt-get install -y cron
# Start service
service cron start
# Start on boot
update-rc.d cron defaults
```

Compare commits in GitHub
```bash
https://github.com/<user>/<repo>/compare/e27fd28..fe48547
```

Install extensions PECL without PECL in docker
```bash
FROM php:8.0.0RC5-cli-buster

RUN mkdir -p /usr/src/php/ext/mongodb \
    && curl -fsSL https://pecl.php.net/get/mongodb | tar xvz -C "/usr/src/php/ext/mongodb" --strip 1 \
    && docker-php-ext-install mongodb
```

Debug slow queries in MySQL
```bash
mysqldumpslow -l /var/log/mysql/slow.log > ~/mysqldumpslow.log
mysqldumpslow -a -s r -t 10 /var/log/mysql/slow.log > ~/mysqldumpslow_no_limit_10.log
mysqldumpslow -a -s c -t 10 /var/log/mysql/slow.log > ~/mysqldumpslow_top_10.log

# In mysql console:
# > SHOW GLOBAL STATUS LIKE 'Slow_queries';
```

Ban IP with IPTABLES
```bash
# Added I: Initial, A: Append
iptables -I OUTPUT -s IP-HERE -j DROP
iptables -I INPUT -s IP-HERE -j DROP

# Delete
iptables -D OUTPUT -s IP-HERE -j DROP
iptables -D INPUT -s IP-HERE -j DROP

# Delete ALL WARNING!
iptables -F

# Preserve changes after reboot
/sbin/iptables-save
```

Hook in git [see](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
```bash
# Pre-commit option
echo '#!/bin/sh

# Run test before add message to commit
if [ -e "vendor/bin/phpunit" ]
then
vendor/bin/phpunit --stop-on-failure --no-coverage --testsuite=unit
fi
' > .git/hooks/pre-commit

# Permission to execute
sudo chmod u+x .git/hooks/pre-commit
sudo chmod o-r .git/hooks/pre-commit
```

Load multiple files in MySQL
```bash
cat file.sql file2.sql | mysql -u database
```

Read files zipped without unzipped
```bash
zcat < file.sql.gz | mysql -u root -p database
# or
gunzip < file.sql.gz | mysql -u root -p database
```

Scaped backslash (\) in MySQL
```mysql
-- Original string: {"required":true,"rules":"regex:\/(^[0-9]{1,14})+(\\.[0-9]{1,2})?$\/","data":null}
-- Scaped it looks like:
SELECT
  REPLACE(column, 'regex:\\/(^[0-9]{1,14})+(\\\\.[0-9]{1,2})?$\\/', 'regex:\\/(^[0-9]{1,12})+(\\\\.[0-9]{1,2})?$\\/')
FROM table
WHERE column LIKE '%regex:\\\\/(^[0-9]{1,14})+(\\\\\\\\.%[0-9]{1,2})?$\\\\\\\/%';
```

Pre-Request in POSTMan
```bash
var moment = require('moment');
var CryptoJS = require('crypto-js');
var devRequest = pm.environment.get('devRequest', "false") == "true";

var auth = {
    'login': (devRequest ? pm.globals.get('login') : pm.collectionVariables.get('login')),
    'tranKey': (devRequest ? pm.globals.get('trankey') : pm.collectionVariables.get('trankey'))
}

var nonce = Math.random().toString(36).substring(2);
var seed = moment().format();
var hashType = pm.environment.get('hashType');
var hash = (hashType === 'SHA256')
    ? CryptoJS.SHA256(nonce + seed + auth.tranKey)
    : CryptoJS.SHA1(nonce + seed + auth.tranKey);

auth.tranKey = hash.toString(CryptoJS.enc.Base64);
auth.nonce = btoa(nonce);
auth.seed = seed;

pm.environment.set('auth', JSON.stringify(auth));
pm.environment.set('expiration', moment().add(120, 'minutes').format());
pm.environment.set('timestamp', moment().unix());
```

Rename tag in GIT
```bash
git tag new old
git tag -d old
git push origin :refs/tags/old
git push --tags
```

Set [permissions](https://linuxize.com/post/chmod-command-in-linux/) in WebServer files
```bash
find /var/www/website -type d -exec chmod 755 {} \;
find /var/www/website -type f -exec chmod 644 {} \;
# or
find /var/www/website -type d -exec chmod u=rwx,go=rx {} \;
find /var/www/website -type f -exec chmod u=rw,go=r {} \;
```

Deploy laravelphp docker image
```bash
# Download
docker pull laravelphp/vapor:php74

# Run container
docker run --name vapor74 -it --rm -d -w /var/www/html laravelphp/vapor:php74

# Use container
docker exec vapor74 sh

# Install PHP extension
apk add --update --no-cache gmp gmp-dev \
    && docker-php-ext-install gmp
```

Error sync branches. [See](https://stackoverflow.com/a/45559485/15601185)
```bash
git config --get remote.origin.fetch
# Only allow master|main
# +refs/heads/master:refs/remotes/origin/master
# +refs/heads/main:refs/remotes/origin/main
# Allow any branch
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch --all
git checkout develop
```

Updated crontab (docker)
```bash
cp -p crontab /etc/crontab
/etc/init.d/cron reload
```

Generate BCRYPT password in PHP
```bash
echo password_hash($pass, PASSWORD_BCRYPT, ['cost' => 12]);
```

Vapor CLI commands
```bash
cd project
composer require laravel/vapor-core
vapor login
> link cloud provider: no
vapor team:list
vapor team:switch
> select id team

# New instance of Vapor (Example: dev)
vapor env dev

# With docker runtime
vapor env dev --docker

# Delete database
vapor database:delete-proxy database-name

# MySQL console
vapor database:shell database-name

# Redis connection local
vapor cache:tunnel database-name

# Deploy instance
vapor deploy dev
```

Password Utility in i3
```bash
sudo apt-get install -y seahorse

ll ~/.local/share/keyrings/*.keystore
```

Unlock SSH Key for i3 session

[See](https://geekoverdose.wordpress.com/2019/03/05/ssh-remember-cache-key-password/)

```bash
ssh-add
# or
ssh-add ~/.ssh/YOUR_PRIVATE_KEY
```

Install [NeoVim](https://neovim.io/)

[See](https://github.com/neovim/neovim/wiki/Installing-Neovim)
[See 2](http://vimcasts.org/episodes/meet-neovim/)

:help nvim-from-vim

```bash
# Home
mkdir -p ~/.config/nvim

# Setup
echo 'set runtimepath+=~/.vim,~/vim/after
let &packpath = &runtimepath
source ~/.vimrc' >> ~/.config/nvim/init.vim

# Install (Latest)
echo "\n" | sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim

# sudo apt-get remove -y neovim && sudo apt-get autoremove

## CoC Settings
ln -s ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
```

Rename files using xargs

[See](https://stackoverflow.com/questions/10972002/batch-renaming-files-in-command-line-and-xargs)

```bash
ll -L *.sql.gz | awk '{print $9 }' | sed 'p;s/20210909/20210910/' | xargs -n2 mv
```

Detect key codes and remaping

[See](https://askubuntu.com/questions/24916/how-do-i-remap-certain-keys-or-devices)
[See 2](https://dev.to/0xbf/remap-keys-in-the-keyboard-in-ubuntu-5a36)
[See 3](https://askubuntu.com/questions/482825/using-setxkbmap-for-a-simple-remap-similar-to-xmodmap)

```bash
# Start
xmodmap -pke > .Xmodmap.backup
# Restore (or Restart?)
xmodmap .Xmodmap.backup
# Key codes
xev | grep keycode
# By example
# Shift:        state 0x0, keycode 50 (keysym 0xffe1, Shift_L), same_screen YES,
# Page Down:    state 0x1, keycode 112 (keysym 0xff55, Prior), same_screen YES,
# Page Up:      state 0x1, keycode 117 (keysym 0xff56, Next), same_screen YES,

# Remap
# Order: # Mode_switch === AltGr ?
    > @see https://unix.stackexchange.com/questions/55076/what-is-the-mode-switch-modifier-for
    > The first keysym is used when no modifier key is pressed in conjunction with this key
    > The second with Shift,
    > The third when the Mode_switch key is used with this key
    > The fourth when both the Mode_switch and Shift keys are used.
    > @see https://www.in-ulm.de/~mascheck/X11/xmodmap.html#format

## Remap Mode_switch + , to Prior (Page Down)
xmodmap -e "keycode 59 = comma semicolon Next Next Next multiply Next"

## Remap Mode_switch + . => Next (Page Up)
xmodmap -e "keycode 60 = period colon Prior Prior Prior division Prior"
```
> Get current keycodes: xmodmap -pke

Install library npm locally

[See](https://2ality.com/2016/01/locally-installed-npm-executables.html)

```bash
mkdir /var/www/html/project
cd /var/www/html/project
npm init
npm install @vue/cli
> /var/www/html/project/node_modules/.bin
npm bin
$(npm bin)/vue create demo
```

Shared Folder from Windows in Linux

[See](https://www.howtogeek.com/176471/how-to-share-files-between-windows-and-linux/)

Rename files using xargs

```bash
ll *20211022.sql.gz | awk '{print $9 " " $9}' | sed 's/22/23/' | awk '{print $2 " " $1}' | xargs -n2 mv
```

Revert git pull execute in incorrect branch

```bash
git reset --hard <SHA>
```
