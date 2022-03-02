
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

    # Partition SWAP
    n -> new partition table (swap)
        Partition number    -> use default -> 2
        First sector        -> use default
        Last Sector         -> +1G

    # Partition System
    n -> new partition table (/)
        Partition number    -> use defautl -> 3
        First sector        -> use default
        Last Sector         -> use default -> free space

# Set partition types
    t -> change type partion (UEFI)
        1 -> UEFI System

    t -> change type partion (swap)
        19 -> Linux swap

    # Last one already has correct type
    t -> change type partion (/)
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

# Mount Partition System
    # Partition SWAP
    swapon /dev/sda2

    # Partition System
    mount /dev/sda3 /mnt

    # Partition UEFI
    mkdir /boot/EFI
    mount /dev/sda1 /boot/EFI

# [Unpackage Arch in system](https://man.archlinux.org/man/pacstrap.8)
    # base              -> base system
    # linux             -> [kernel](http://kroah.com/log/blog/2018/08/24/what-stable-kernel-should-i-use/) (don't require in containers)
                        -> stable: Vanilla Linux kernel and modules, with a few patches applied.
                        -> [5.16.11](https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.16.11)
    # linux-firmware    -> kernel (don't require in VM's or containers)
    # man-pages         -> Really? Linux man pages (don't require in VM's or containers)
    # man-db            -> Kidding? A utility for reading man pages (don't require in VM's or containers)

    # As VM or container
    pacstrap /mnt base linux vi

    # As Host
    pacstrap /mnt base linux linux-firmware man-pages man-db

# [File System Table](https://wiki.archlinux.org/title/Fstab)
genfstab -U /mnt >> /mnt/etc/fstab

# [Change Root User](https://wiki.archlinux.org/title/Change_root)
arch-chroot /mnt

# [Set Time Zone](https://wiki.archlinux.org/title/Time_zone)
ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime

# UTC!
hwclock --systohc

# Install another utils require with [pacman](https://man.archlinux.org/man/pacman.8)
## -S -> sync
pacman -S vi sudo grub
## UEFI needs
### efibootmgr  -> Linux user-space application to modify the EFI Boot Manager
pacman -S efibootmgr

# Set Locale
## Uncomment line en_US.UTF-8 UTF-8
vi /etc/locale.gen

locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

## Keymaps persistent
echo 'KEYMAP=la-latin1' > /etc/vconsole.conf

# Networking
echo 'arch' > /etc/hostname

# [Append Route to Localhost](https://wiki.archlinux.org/title/Network_configuration)
vi /etc/hosts
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
usermod -aG wheel,audio,optical,storage,video freddie

## Enable freddie as sudo (sudo command)
### Uncomment
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# [Enable GRUB](https://wiki.archlinux.org/title/GRUB)
grub-install --target=x86_64-fi --bootloader-id=grub-uefi --recheck

## Updated Timeout GRUP screen 5 -> 0 seconds
sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=0/g' /etc/default/grub
## Disable OS Prober warning
sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub

## GRUB config file
grub-mkconfig -o /boot/grub/grub.cfg

# Turn-off hibernation
sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf
sed -i 's/#LidSwitchIgnoreInhibited=yes/LidSwitchIgnoreInhibited=no/g' /etc/systemd/logind.conf
systemctl restart systemd-logind

# Ending (for now)
exit

# Unmount devices
## R    -> recursive
umount -R /mnt

# Shutdow and remove ISO or USB
shutdown now

# Packages installe until here
pacman -Q | wc --lines
274

# Extra installation after base system ends

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

# Main
sudo pacman -S vim konsole unzip tree htop xcompmgr feh pavucontrol networkmanager
## vim              -> 1 pkg
## konsole          -> 92 pkgs
## unzip            -> 1 pkg
## tree             -> 1 pkg
## htop             -> 1 pkg
## xcompmgr         -> 12 pkgs
## feh              -> 29 pkgs
## pavucontrol      -> 73 pkgs
## networkmanager   -> 18 pkgs

# Enable Network Manager
sudo systemctl enable NetworkManager

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

# Install git
sudo pacman -S git
## git              -> 6 pkgs

## Set globals git

# Install Zsh
sudo pacman -S zsh python ttf-fira-code
## zsh              -> 1 pkg
## python           -> 2 pkgs
## ttf-fira-code    -> 2 pkgs
```
> Driver for nVidia: pacman -S xf86-video-nouveau
