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
> [YT](https://www.youtube.com/watch?v=4PBqpX0_UOchttps://www.youtube.com/watch?v=4PBqpX0_UOc)

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
