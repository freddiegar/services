HOW TO (Tears in my eyes)
___

# Laravel cache permissions.

https://stackoverflow.com/questions/52065513/your-configuration-files-are-not-serializable
```bash
COMMAND:
php artisan cache:clear

OUTPUT:
Failed to clear cache. Make sure you have the appropriate permissions.

CHECK:
Config files has Clousure, refactor
```

Laravel config cache doesn't work

```bash
COMMAND:
php artisan config:cache

OUTPUT:
Your configuration files are not serializable.

CHECK:
Config (config/*) files has Clousure, refactor!. This aren't allowed.
```

Symfony env vars

```bash
COMMAND:
Go to page in browser

OUTPUT:
It's return 500 error

CHECK:
Your password database doesn't has special chars, else, encode with urlencode function

After that, clear cache, it doesn't work, See 2

SEE:
[See 1](https://github.com/symfony/skeleton/issues/40)
[See 2](https://github.com/symfony/symfony/issues/35568)
```

Downgrade|Upgrade PHP version in Ubuntu

```bash
sudo update-alternatives --config php
```

Detect EFI Systems in Linux

```
ls /sys/firmware/efi/efivars/

# If path exists, YES, you have UEFI system
```

Mount ISO image in USB

!!!Disable Secure Boot in BIOS!!!
!!!Format USB BEFORE!!!

[See](https://wiki.archlinux.org/title/USB_flash_installation_medium)

```bash
# List block devices
lsblk

# Connect USB, and run again: lsblk
lsblk

# as sudo
sudo su

# unmount, MAKE SURE!
udisksctl unmount -b /dev/sda

# dd: disk and dump (or disk and destroyer :|)
## if: Input File
## of: Output File
## status: Verbose option
## sync command: send all from cache
sudo dd bs=4M if=/home/freddie/Downloads/archlinux-x86_64.iso of=/dev/sda conv=fsync oflag=direct status=progress && sync

# or

sudo cp /home/freddie/Downloads/archlinux-x86_64.iso /dev/sda
sudo cat /home/freddie/Downloads/archlinux-x86_64.iso > /dev/sda
sudo nautilus -> right clic on iso file -> open with -> Disk Image Writer

# Detach stick to extract
udisksctl power-off -b /dev/sda
```
> [YT](https://www.youtube.com/watch?v=4PBqpX0_UOc)

Format USB stick

```bash
# List block devices
lsblk

# Connect USB, and run again: lsblk
lsblk

sudo dd if=/dev/zero of=/dev/sda bs=4k status=progress

sudo fdisk /dev/sda
# After o -> Create DOS partition
# After n -> Create new partition
        p -> primary (default)
        1 -> first (default)
        2048 -> start (default)
        2048 -> finish (default)
# After w -> Write changes

udisksctl unmount -b /dev/sda
udisksctl power-off -b /dev/sda
```
> [SO](https://askubuntu.com/questions/198065/how-to-format-a-usb-drive)

Convert id_rsa to ppk (Filezilla or Putty)

```bash
apt-get install putty-tools
# pacman -S putty

puttygen ~/.ssh/id_rsa.ftpusr -o ~/.ssh/ftpusr@ftp.ppk
```

Enable SSH Private Key Auth

```bash
COMMAND:
sftp -i /var/www/html/$USER/kftp/ssh/id_rsa -P 22 kftpusr@kftp

OUTOUT:
Permission denied (publickey,password,keyboard-interactive)

CHECK:
In Server (aka: kftp) check in file `/etc/ssh/sshd_config` next values:

# Not allow password
PasswordAuthentication no
ChallengeResponseAuthentication no
# Allow private key
PubkeyAuthentication yes
# Where are private keys?
AuthorizedKeysFile .ssh/authorized_keys
```
> In `authorized_keys` file add all pub keys allowed
> @see: man ssh
> Too: check pemissions in dir and files (in host and guest machines)
> .ssh                  -> 700
>   id_rsa              -> 600
>   id_rsa.pub          -> 600
>   authorized_keys     -> 600

Change author commit in git

[See](https://stackoverflow.com/questions/3042437/how-to-change-the-commit-author-for-one-specific-commit#3042512)
[See --force](https://githint.com/questions/overwrite-remote-commit-history)

```bash
# Show current commits
git log
# Select commit before to change (N+1)
git rebase -i ffd697b
# Before command open Vim, change `pick` to `edit` in lines required (with bad author info)
# Close Vim
git commit --amend -S --author="Freddie Gar <freddie@gar.com>" --no-edit
git rebase --continue
```

or, many using N as number's commits before

```bash
git rebase -i HEAD~N -x "git commit -S --amend --author 'Freddie Gar <freddie@gar.com>' --no-edit --no-verify"
# If changes already in origin
git push --force
```

Change order commits in git

[See](https://stackoverflow.com/a/44173773/15601185)

```bash
git rebase -i HEAD~N

# Before
pick df89a81 Something committed too early.
pick 4968dbd Fixing an error in commit df89a81.
pick acb05b3 Some final commit.

# After
pick df89a81 Something committed too early.
squash 4968dbd Fixing an error in commit df89a81.
pick acb05b3 Some final commit.

# Insert|Change message commit and close editor

# Now
648q9oq New message commit after squash
acb05b3 Some final commit.
```

Squash commits in git

```bash
git reset --soft HEAD~N &&
git commit
```
N = number of commits to squash

Supervisor error

unix:///var/run/supervisor.sock no such file
error: <class 'socket.error'>, [Errno 2] No such file or directory: file: /usr/lib/python2.7/socket.py line: 228

```bash
# Start deamon
systemctl start supervisord

## Double-check! Is diferent to:
# Start instance on deamon
# service supervisor start
```
> Fix adding service start auto after reboot: systemctl enable supervisord
> service supervisor status
> service supervisor start
> service supervisor stop

Install WP-CLI

[See](https://github.com/wp-cli/wp-cli)
[See 2](https://wordpress.stackexchange.com/questions/127917/generating-po-mo-translating-files-from-scratch-in-a-wordpress-theme)

```bash
sudo curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
sudo chmod +x /usr/local/bin/wp
## Update: wp cli update
## Generate .mo files from .po files: cd plugin && wp i18n make-mo languages languages
```

Test Localy PR from GitHub with gh

[See](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/checking-out-pull-requests-locally)

```bash
cd /git/project
gh pr checkout #pr
## gh pr checkout 43
```

Rollback WordPress version and avoid automatic updates

```bash
# Backups
cp -pr wordpress wordpress-backup

# Download version rollback from https://wordpress.org/download/releases/
cd /var/www/html/wordpress
sudo rm -Rf 5.9
sudo unzip ~/Downloads/wordpress-5.9.3.zip -d /var/www/html/wordpress/
sudo mv wordpress 5.9
sudo rm -Rf 5.9/wp-content
sudo cp -pr /var/www/html/wordpress-backup/5.9/wp-content /var/www/html/wordpress/5.9
sudo cp -pr /var/www/html/wordpress-backup/5.9/wp-config.php /var/www/html/wordpress/5.9/
sudo chown www-data:www-data /var/www/html/wordpress/5.9 -Rf

# In wp-config.php adds

define( 'AUTOMATIC_UPDATER_DISABLED', true );
define( 'WP_AUTO_UPDATE_CORE', false );
```

PDF Drive (free?)
[See](https://www.pdfdrive.com/)

Get information from PEM file

```bash
# Get body
openssl x509 -in filename.pem | sed -e '1d;$d' > body.txt

# Get private key
openssl pkey -in filename.pem -out key.txt
```

Show Video Driver

```bash
sudo lshw -c video

# or

lspci -nn | grep -E 'VGA|Display'
```

# Renew GPG

[See](https://superuser.com/questions/813421/can-you-extend-the-expiration-date-of-an-already-expired-gpg-key#1141251)

```bash
gpg --list-keys
gpg --edit-key O6QN77Q432NQRQ0S
gpg> expire // encryption key: sec
    1y
gpg> key 1  // encryption subkey: ssb*
gpg> expire
    1y
gpg> save

gpg --list-keys
```

# Get data from certificate tls

[See #6](https://www.baeldung.com/linux/openssl-extract-certificate-info)

```bash
openssl s_client -connect duckduckgo.com:443 -showcerts </dev/null | openssl x509 -outform pem > duckduckgo.com.pem
openssl x509 -in duckduckgo.com.pem -noout -text
# Expiration dates
openssl x509 -in duckduckgo.com.pem -noout -dates
# Check expirations in seconds 60*60*24*30 -> 2592000
openssl x509 -in duckduckgo.com.pem -noout -checkend 2592000
```

# Fix Bluetooth issue

[See](https://www.reddit.com/r/Ubuntu/comments/owbdc3/boot_error_bluetooth_failed_to_send_firmware_data/)

```bash
# > Bluetooth: hci0: Failed to send firmware data (-110)
# sudo dmesg | grep Blue | grep Failed
sudo apt remove --purge --auto-remove bluez
sudo rfkill list
rfkill unblock bluetooth
```

# Ytdl

[See](https://github.com/ytdl-org/youtube-dl)

```bash
# Banned!
# sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
cd /var/www/html
mkdir ytdl-org
git clone --depth=1 https://github.com/ytdl-org/youtube-dl.git
make youtube-dl
sudo chmod a+rx /var/www/html/ytdl-org/youtube-dl/youtube-dl
sudo ln -s /var/www/html/ytdl-org/youtube-dl/youtube-dl /usr/local/bin/youtube-dl

# Pre-requisites (convert to only audio)
sudo apt-get install -y ffmpeg

# Download
# python3 /usr/local/bin/youtube-dl --ignore-errors --yes-playlist --yes-playlist --extract-audio -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://music.youtube.com/watch?v=jiP2uZu5fBY&list=RDAOy1jlKyX_GYhAAPvBR43tFQ
fd https://music.youtube.com/watch?v=jiP2uZu5fBY&list=RDAOy1jlKyX_GYhAAPvBR43tFQ
```

Speed-up load GTK applications

[See](https://unix.stackexchange.com/a/594553)

```bash
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
```

Get plain password's WiFi

```bash
sudo vim /etc/NetworkManager/system-connections
```

Error connecting to agent: No such file or directory

```bash
eval `ssh-agent | tee ~/.ssh/agent.env`
```

Upload tree in FTP

```bash
sudo apt-get install -y ncftp

ncftpput -R -m -v -P 21 -t 3600 -f file.cfg /public_html/app /var/www/html/app

# file.cfg
host fpt
user username
pass *****
```

Connection Bluetooth Device

```bash
hcitool dev
# Devices:
# 	hci0	78:AF:08:2A:EF:71
# Enable pairing in device
hcitool -i hci0 scan
# Enable connection
bluetoothctl trust AC:80:0A:14:76:5C
bluetoothctl connect AC:80:0A:14:76:5C
# Show
bluetoothctl devices
```
> Sudio
> bluetoothctl
> power on
> scan on
> agent on
> devices
> pair 41:42:2F:7A:4C:D4
> # cancel-pairing 41:42:2F:7A:4C:D4
> trust 41:42:2F:7A:4C:D4
> # untrust 41:42:2F:7A:4C:D4
> connect 41:42:2F:7A:4C:D4
> # disconnect 41:42:2F:7A:4C:D4
> exit

Remove snap

[See](https://www.debugpoint.com/remove-snap-ubuntu/)

```bash
sudo snap list
sudo snap remove --purge *
sudo apt remove --autoremove snapd

echo 'Package: snapd
Pin: release a=*
Pin-Priority: -10' | sudo tee /etc/apt/preferences.d/nosnap.pref
```

Show deprecations details in Laravel

```php
# In TestCase.php

protected function setUp(): void
{
    parent::setUp();

    $this->withoutDeprecationHandling();
}

```

Show deprecations details in PHPUnit 9.6

```xml
# phpunit.xml
<phpunit xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" backupGlobals="false" backupStaticAttributes="false" bootstrap="./vendor/autoload.php" colors="true" convertErrorsToExceptions="true" convertNoticesToExceptions="true" convertWarningsToExceptions="true" processIsolation="false" stopOnFailure="false" xsi:noNamespaceSchemaLocation="https://schema.phpunit.de/9.3/phpunit.xsd">

<php>
    <ini name="error_reporting" value="-1"/>
    <server name="PHPUNIT_ERROR_HANDLER" value="PHPUnit\Util\ErrorHandler::handleDeprecation"/>
</php>
```

Show deprecations details in PHPUnit 10

In phpunit.xml file [adds](https://stackoverflow.com/a/77101546/15601185)

```xml

displayDetailsOnIncompleteTests="true"
displayDetailsOnSkippedTests="true"
displayDetailsOnTestsThatTriggerDeprecations="true"
displayDetailsOnTestsThatTriggerErrors="true"
displayDetailsOnTestsThatTriggerNotices="true"
displayDetailsOnTestsThatTriggerWarnings="true"

```

or

```bash

php8.4 vendor/bin/phpunit --configuration phpunit-pipelines.xml --no-coverage --display-deprecations --testsuite Acl > Acl.log

```

Enable autosuggestions in oh-my-zsh

```bash
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

plugins=(
    zsh-autosuggestions
    # zsh-syntax-highlighting
)
> /home/freddie/.zshrc

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# @see https://www.gnu.org/software/bash/manual/bash.html#Event-Designators
# !*
```

JSON to CSV

[See](https://richrose.dev/posts/linux/jq/jq-json2csv/)

```bash
jq -r '.stock[] | [.id, .item, .description] | @csv' test.json
```

CSV to JSON

[See](https://stackoverflow.com/a/65100738)

```bash
command cat test.csv | python3 -c 'import csv, json, sys; print(json.dumps([dict(r) for r in csv.DictReader(sys.stdin)]))' | > test.json
```

[See](https://richrose.dev/posts/linux/jq/jq-csv2json/)

```bash
jq -R '{questions: [inputs | split(",") | {item: .[0], task: .[1]}]}' < test1.csv
```

Install AWS VPN Client

[See](https://docs.aws.amazon.com/vpn/latest/clientvpn-user/client-vpn-connect-linux-release-notes.html)

```bash
curl -L https://d20adtppz83p9s.cloudfront.net/GTK/5.2.0/awsvpnclient_amd64.deb -o awsvpnclient.deb
sudo dpkg -i awsvpnclient.deb
rm -f awsvpnclient.deb
## sudo dpkg --remove awsvpnclient
```

Speed up testing in MySQL

[See](https://www.kiloroot.com/create-a-ram-disk-in-linux-tell-mysql-to-put-stuff-there/)

```bash
echo "#!/bin/sh

mkdir -p /run/shm/mysqltemp
chmod 777 /run/shm/mysqltemp
exit 0" | sudo tee -a /etc/rc.local

sudo chmod 744 /etc/rc.local
```

Show heap size limit in node

```bash
node -e 'console.log(v8.getHeapStatistics().heap_size_limit/(1024*1024))'

# Change value to 4G, 8G, 16G
export NODE_OPTIONS="--max-old-space-size=4096"
export NODE_OPTIONS="--max-old-space-size=8192"
export NODE_OPTIONS="--max-old-space-size=16384"
```

Docker Layer Caching
1. Changes to the files you're copying
2. Changes to the Dockerfile instruction
3. Changes to any previous layer

Docker Layer Squashing
1. Each layer in Dokcer is immutable and contains only changes from previous layer
2. Separate RUN cvommand create new layers, preserving files from earlier layers (rm command in after RUN doesn't works)
3. Deleting files in later layers doesn't remove them from earlier layers
4. Deleted files are marked as 'not accessible' but still consume sapce in the image
5. Docker can't remove data from previous layers due to their immutability

Android File Transfer (photos from phone)

```bash
sudo apt-get install -y android-file-transfer
```

Update from LTS to last release Ubuntu

[See]()

```bash
# Needs GTK!
update-manager -c

cat /etc/update-manager/release-upgrades

sudo sed -i 's/Prompt=lts/Prompt=normal/g' /etc/update-manager/release-upgrades

cat /etc/update-manager/release-upgrades

# Check
do-release-upgrade -c

# Upgrade
do-release-upgrade
```

How create slides using Slides (go)

```bash
# Create slides
touch slides.md
# Enable executions <C-e>
chmod +x slides.md
# Presentation mode
slides slides.md
```

GIT Large File Storage - LFS (in GIT repository)

[See](https://git-lfs.com/)

```bash
## Enable in repository (max filesize in GitHub is: 100M)
git lfs install

## On working repository
git lfs track "*.sql.gz"
git add .gitattributes
## Add other files *.sql.gz
git commit -m "Added lfs support"

## Undo LFS behaviour
git lfs migrate export --include="*.sql.gz" --everything
```

LFS Delete Files in Server

[See](https://www.atlassian.com/git/tutorials/git-lfs#deleting-remote-files)
[GitHub](https://docs.github.com/en/repositories/working-with-files/managing-large-files/removing-files-from-git-large-file-storage)
[Thanks](https://www.youtube.com/watch?v=NmiLVk23B9c)

```bash
# see quota
go to https://github.com/settings/billing/summary
# show ALL files tracking in repository
git lfs ls-files --all --long
# show stats about usage by extension file
git lfs migrate info --everything
# sync all files locally (must be show same counter as command before)
git lfs fetch --all
# confirmation
git lfs checkout
# needs description?
git lfs uninstall
# remove tracking files (or manual in .gitattributes files: grep "filter=lfs" .gitattributes)
git lfs untrack "*.sql.gz"
# applies filters again, to reflect changes in .gitattributes file
git add --renormalize .
# push to origin IMPORTANT command
git push --verbose origin
# convert pointer in blob files DANGEROUS command
git lfs migrate export --everything --include="*.sql.gz"
# sync remote
git push --verbose origin --force
```

Keep open SSH session

```bash
# sh
while true; do sleep 1; done

# bash | zsh
while :; do sleep 1; done
```

Convert MySQL DUMP to SQLite

[See](https://dev.to/damms005/laravel-migration-squashing-and-use-of-sqlite-in-automated-testing-2d5k)

```bash
sudo apt-get install sqlite3 --no-install-recommends -y

mkdir /var/www/html/mysql2sqlite
cd /var/www/html/mysql2sqlite
git clone --depth=1 git@github.com:mysql2sqlite/mysql2sqlite.git
cd mysql2sqlite

# In Laravel project
# /var/www/html/mysql2sqlite/mysql2sqlite/mysql2sqlite database/schema/mysql-schema.sql > database/schema/sqlite-schema.sql
```
