UTIL COMMANDS
___

Create database
```mysql
create database homestead charset=utf8;
```

Create user database mysql
```mysql
create user homestead identified by 'password';
grant all privileges on homestead.* to 'homestead'@'%' identified by 'password' with grant option;
flush privileges;
```

Set password in MySQL (5.6 +)
```mysql
set password for 'homestead'@'%' = PASSWORD('password');
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
git commit -C ORIG_HEAD
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
mysqldump --opt -u[user_name] -p [database_name] | gzip > [backup_file].dump.gz
```

MySQL dump from container
```bash
mysqldump --opt -u[user_name] -p [database_name] | gzip > [backup_file].dump.gz
docker cp [container]:/path/in/container /path/in/host
```

MySQL dump restore
```bash
gunzip -k [backup_file].dump.gz
mysql -u[user_name] -p [database_name] < [backup_file].dump
```

File large size list
```bash
du -cks * | sort -rn | head
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
