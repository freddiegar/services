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

```bash
# List block devices
lsblk

# Connect USB, and run again: lsblk
lsblk

# as sudo
sudo su

# dd: disk and dump (or disk and destroyer :|)
## if: Input File
## of: Output File
## status: Verbose option
dd if=/path/yo/file.iso of=/dev/sda status="progress"
# dd if=/home/freddie/Downloads/ISO/archlinux-2022.02.01-x86_64.iso of=/dev/sda status="progress"
```
> [YT](https://www.youtube.com/watch?v=4PBqpX0_UOc)

Format USB stick

```bash
# List block devices
lsblk

# Connect USB, and run again: lsblk
lsblk

sudo dd if=/dev/zero of=/dev/sdb bs=4k status="progress"

sudo fdisk /dev/sdb
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

```bash
# Show current commits
git log
# Select commit before to change
git rebase -i ffd697b
# Before command open Vim, change `pick` to `edit` in lines required (with bad author info)
# Close Vim
git commit --amend -S --author="Freddie Gar <freddie@gar.com>" --no-edit
git rebase --continue
```

or, many using N as number's commits before

```bash
git rebase -i HEAD~N -x "git commit --amend --author 'Freddie Gar <freddie@gar.com>' --no-edit"
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

Install gh-CLI

[See](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

```bash
# Install
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt-get update
sudo apt-get install -y gh

# Auth (need token from: https://github.com/settings/tokens)
## Interactive
gh auth login
## or
gh config set -h github.com git_protocol ssh
```

Test Localy PR from GitHub with gh

[See](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/checking-out-pull-requests-locally)

```bash
cd /git/project
gh pr checkout pull-request
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
