
Installing Debian Bare

```bash
su root
# Packages: 345
# usermod -aG sudo freddie?
apt-get update
apt-get install -y sudo
# Packages: 346
apt-get install -y xinit xserver-xorg
# Packages: 436
apt-get install -y i3
echo 'exec i3' >> /home/freddie/.xinitrc
# Packages: 507
exit
startx
# Mount VB.iso
lsblk -f
```

Installing Arch Linux

[See](https://wiki.archlinux.org/title/Installation_guide)
[See 2](https://www.youtube.com/watch?v=PQgyW10xD8s)

```bash
loadkeys la-latin1
fdisk -l

fdisk /dev/sda

# GUID Partition Table
g -> Create a nre empty GPT partition table

# Create partitions
    # Partition UEFI
    n -> new partition table (UEFI)
        Partition number    -> use default -> 1
        First sector        -> use default
        Last Sector         -> +550M

    # Partition SWAP (1.5 * memory ram)
    n -> new partition table (swap)
        Partition number    -> use default -> 2
        First sector        -> use default
        Last Sector         -> +1G

    # Partition System
    n -> new partition table (/) (~25G)
        Partition number    -> use defautl -> 3
        First sector        -> use default
        Last Sector         -> +25G

    # Partition System
    n -> new partition table (/home) (whole)
        Partition number    -> use defautl -> 4
        First sector        -> use default
        Last Sector         -> use default -> free space

# Set partition types
    t -> change type partition (UEFI)
        1 -> UEFI System

    t -> change type partition (swap)
        19 -> Linux swap

    # Last already has correct type
    t -> change type partition (/)
        20 -> Linux system

# Write changes
    w -> write table to disk and exit

# Show changes
fdisk -l

# Make filesystem
    # Partition UEFI
    mkfs.fat -F32 /dev/sda1

    # Partition SWAP
    mkswap /dev/sda2

    # Partition System
    mkfs.ext4 /dev/sda3

    # Partition Home
    mkfs.ext4 /dev/sda3

# Mount Partition System
    # Partition SWAP
    swapon /dev/sda2

    # Partition System
    mount /dev/sda3 /mnt

    # Partition System
    mkdir /mnt/home
    mount /dev/sda4 /mnt/home

# [Unpackage Arch in system](https://man.archlinux.org/man/pacstrap.8)
    # base              -> base system
    # base-devel        -> base utils (sudo, gcc and friends. Don't require in VM's or containers)
    # linux             -> [kernel](http://kroah.com/log/blog/2018/08/24/what-stable-kernel-should-i-use/) (don't require in containers)
                        -> stable: Vanilla Linux kernel and modules, with a few patches applied.
                        -> [5.16.11](https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.16.11)
    # linux-firmware    -> kernel (don't require in VM's or containers)
    # man-pages         -> Really? Linux man pages (don't require in VM's or containers)
    # man-db            -> Kidding? A utility for reading man pages (don't require in VM's or containers)

    ## 231  Installed in this point

    # As VM or container
    pacstrap /mnt base base-devel linux vim
    ## 110  new packages ~460M  Installed
    ## 32   new packages ~351M  Installed
    ## 3    new packages ~161M  Installed
    ## 3    new packages ~36M   Installed

    ## 379  Installed in this point

    # As Host
    pacstrap /mnt base base-devel linux linux-firmware vim man-pages man-db

# [File System Table](https://wiki.archlinux.org/title/Fstab)
## U    -> Use unique id over label. It's better!
genfstab -U /mnt >> /mnt/etc/fstab

# [Change Root User](https://wiki.archlinux.org/title/Change_root)
arch-chroot /mnt

# [Set Time Zone](https://wiki.archlinux.org/title/Time_zone)
ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime

# UTC!
hwclock --systohc

# Install another utils require with [pacman](https://man.archlinux.org/man/pacman.8)
## -S -> sync
pacman -S sudo grub
## 1 new packages ~6M   Installed
## 1 new packages ~34M  Installed

## UEFI needs!
### efibootmgr  -> Linux user-space application to modify the EFI Boot Manager
pacman -S efibootmgr
## 2 new packages ~1M   Installed

# Of course, I need network
pacman -S networkmanager
## 17 new packages  ~17M    Installed

# And Enable Network Manager on Boot
systemctl enable NetworkManager

# Set Locale
## Uncomment line en_US.UTF-8 UTF-8
vim /etc/locale.gen

locale-gen

echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'LC_CTYPE=en_US.UTF-8' >> /etc/locale.conf

## Keymaps persistent
echo 'KEYMAP=la-latin1' > /etc/vconsole.conf
localectl set-x11-keymap latam
# setxkbmap -model pc105

# Networking
echo 'arch' > /etc/hostname

# [Append Route to Localhost](https://wiki.archlinux.org/title/Network_configuration)
vim /etc/hosts
127.0.0.1   localhost
::1         localhost
127.0.1.1   arch.localdomain    arch

# Root Password
passwd

# [General Configuration](https://wiki.archlinux.org/title/General_recommendations)

## [Create Personal User](https://wiki.archlinux.org/title/Users_and_groups)
### m -> --create-home
useradd -m freddie
passwd freddie

## Groups
### wheel -> Administration group, commonly used to give privileges to perform administrative actions (su or sudo)
### audio   -> Direct access to sound hardware, for all sessions
### optical -> Access to optical devices such as CD and DVD drive
### storage -> Used to gain access to removable drives such as USB hard drives
### video   -> Access to video capture devices (diff to X11)
usermod -G wheel,audio,optical,storage,video -a freddie

## Enable freddie as sudo (using sudo command)
### Uncomment or run: visudo
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Partition UEFI
mkdir /boot/efi
mount /dev/sda1 /boot/efi

# [Enable GRUB](https://wiki.archlinux.org/title/GRUB)
grub-install --target=x86_64-efi --bootloader-id=grub-uefi --recheck

## Updated Timeout GRUP screen 5 -> 0 seconds
sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=0/g' /etc/default/grub
## Disable OS Prober warning
sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub

## GRUB config file
grub-mkconfig -o /boot/grub/grub.cfg

# Turn-off hibernation
sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf
sed -i 's/#LidSwitchIgnoreInhibited=yes/LidSwitchIgnoreInhibited=no/g' /etc/systemd/logind.conf

# Ending (for now)
exit

# Unmount devices
## R    -> recursive
umount -R /mnt

# Shutdow and remove ISO or USB
shutdown now

# Packages installed until here
pacman -Q | wc --lines
379

# Power-off and remove USB booteable
shutdown now

###########################################
# Extra installation after base system ends
###########################################

# Packages installed until here
pacman -Q | wc --lines
160
/ -> 1.9G

# Update Packages
pacman -Syu

        # In VirtualBox installation
        ================
        [See](https://wiki.archlinux.org/title/VirtualBox/Install_Arch_Linux_as_a_guest)
        pacman -S virtualbox-guest-utils xf86-video-fbdev
        ## virtualbox-guest-utils   -> 1 pkg
        ## xf86-video-fbdev         -> 1 pkg

        ## Enable VBox service to share folders
        sudo systemctl enable vboxservice.service
        sudo systemctl start vboxservice.service

        ## Enable user in guest run
        usermod -aG vboxsf freddie
        ## Require logout
        shutdown -r now

        ## Enable clipboard in guest run:
        VBoxClient --clipboard
        ================

        # In Virt-Manager installation
        ================
        [See](https://youtu.be/9FBhcOnCxM8?t=650)
        View -> Details -> Overview -> Add Hardware
        -> Filesystem -> Mode: Mapped -> Browse Local
        -> Source: /var/www/html
        -> Target: /sharepoint

        On error: Failed to initialize fs-driver with id:fsdev0
        Check Permissions in Host folder:
            chmod 775 /var/www
            chmod 775 /var/www/html
            chown $USER:$USER /var/www
            chown $USER:$USER /var/www/html

        On guest:
            [See](https://cialu.net/qemu-kvm-on-ubuntu-and-sharing-files-between-host-and-guests/)
            sudo vi /etc/rc.local
            sudo mkdir /var/www/html
            sudo mount -t 9p -o trans=virtio,version=8p2000.L /sharepoint /var/www/html

exit 0
        ================

# Auth with freddie user

# Install git
sudo pacman -S git
## 4 new packages  ~34M    Installed
git config --global user.name "Freddie Gar"
git config --global user.email freddie.gar@outlook.com
git config --global core.editor "vim"
git config --list

sudo mkdir -p /var/www/hmtl
sudo chown freddie:freddie /var/www/hmtl
sudo chmod 755 /var/www/hmtl
mkdir -p /var/www/hmtl/freddiegar

# Install X-server and TWM
sudo pacman -S xorg
## 48 new packages  ~298M    Installed
sudo pacman -S xorg-xinit
## 1  new packages  ~1M    Installed
sudo pacman -S i3-wm
## 14 new packages  ~9M    Installed
sudo pacman -S i3lock
## 1 new packages   ~1M    Installed
sudo pacman -S i3status
## 14 new packages  ~10M    Installed
sudo pacman -S feh
## 15 new packages  ~61M    Installed
sudo pacman -S xcompmgr
## 1 new packages   ~1M    Installed

# Compile Terminal
git clone --depth=1 https://github.com/freddiegar/st.git
cd st
sudo make clean install

# Sincronize my settings
cd ..
git clone --depth=1 https://github.com/freddiegar/services.git
cd services

# Start i3 with startx command
echo 'exec i3' >> ~/.xinitrc

mkdir -p ~/.config/i3
ln -s `pwd`/i3/config ~/.config/i3/config
ln -s `pwd`/i3/status.conf ~/.config/i3/status.conf
ln -s `pwd`/i3/battery ~/.config/i3/battery-popup

# Packages installed until here
pacman -Q | wc --lines
322
/ -> 2.4G

reboot

sudo pacman -S firefox-developer-edition
## 66 new packages   ~565M   Installed
sudo ln -s `which firefox-developer-edition` /usr/bin/firefox

sudo pacman -S ttt-fira-code
## 1 new packages   ~2M   Installed

# Main
sudo pacman -S konsole unzip tree htop xcompmgr feh pavucontrol
## konsole          -> 92 pkgs
## unzip            -> 1 pkg
## tree             -> 1 pkg
## htop             -> 1 pkg
## xcompmgr         -> 12 pkgs
## feh              -> 29 pkgs
## pavucontrol      -> 73 pkgs

sudo pacman -S xorg i3
## xorg             -> 56 pkgs
## i3               -> 16 pkgs

## Create SymLink to
vim
alias
konsole
i3
wallpapers

# Packages installe until here
pacman -Q | wc --lines
390

## Set globals git

# Install Zsh
sudo pacman -S zsh python ttf-fira-code
## zsh              -> 1 pkg
## python           -> 2 pkgs
## ttf-fira-code    -> 2 pkgs
```
> Driver for nVidia: pacman -S xf86-video-nouveau
