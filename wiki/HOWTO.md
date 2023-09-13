HOW TO (Tears in my eyes)
___

Laravel cache permissions. see
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
dd bs=4M if=/home/freddie/Downloads/archlinux-x86_64.iso of=/dev/sda conv=fsync oflag=direct status=progress

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
# After w -> Write changes

sudo umount /dev/sdb1
sudo reject /dev/sdb
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
648q9oq New message commit after sqush
acb05b3 Some final commit.
```

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

gpg> key O6QN77Q432NQRQ0S
gpg> expire
    1y
gpg> save
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
# dmesg| g Blue
# > Bluetooth: hci0: Failed to send firmware data (-110)
sudo apt remove --purge --auto-remove bluez
sudo rfkill list
rfkill unblock bluetooth
```

# Ytdl

[See](https://github.com/ytdl-org/youtube-dl)

```bash
# Install
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Pre-requisites (convert to only audio)
sudo apt-get install -y ffmpeg

# Download
python3 /usr/local/bin/youtube-dl --ignore-errors --yes-playlist --yes-playlist --extract-audio -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://music.youtube.com/watch?v=jiP2uZu5fBY&list=RDAOy1jlKyX_GYhAAPvBR43tFQ
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
