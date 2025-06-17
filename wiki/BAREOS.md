
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

Installing Arch Linux (on SSH)

[See](https://wiki.archlinux.org/title/Install_Arch_Linux_via_SSH)

```bash
# Keyboard
loadkeys la-latin1

# Fonts
setfont ter-132b

# Connect to network (Wi-fi)
iwctl
station list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect Virus
Ctrl+D (to quit)

# Show IP address
ip a
ip link
ping archlinux.org

# Enable to root login in ssh
passwd
cat /etc/ssh/sshd_config | grep PermitRootLogin
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd.service

# In local machine
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@ip

## Continue from this in next steps
```

Installing Arch Linux

[See](https://wiki.archlinux.org/title/Installation_guide)
[See 2](https://www.youtube.com/watch?v=PQgyW10xD8s)

```bash
archinstall

# Turn-off hibernation
grep 'HandleLidSwitch=\|LidSwitchIgnoreInhibited=' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf
sudo sed -i 's/#LidSwitchIgnoreInhibited=yes/LidSwitchIgnoreInhibited=no/g' /etc/systemd/logind.conf
grep 'HandleLidSwitch=\|LidSwitchIgnoreInhibited=' /etc/systemd/logind.conf
sudo systemctl restart systemd-logind

# Locale
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'LC_CTYPE=en_US.UTF-8' >> /etc/locale.conf

# Keymaps persistent
localectl set-x11-keymap latam
## setxkbmap -model pc105
## cat /etc/vconsole.conf

# Reload changes
quit

# Packages installed until here
pacman -Q | wc --lines
# 200 packages

# Install another utils require with [pacman](https://man.archlinux.org/man/pacman.8)
## -S -> sync

sudo pacman -S nvim
# +16 -> 216 packages

sudo pacman -S python3 python-pynvim
# +2 -> 218 packages
# +3 -> 221 packages

# Ending (for now)
exit

# Unmount devices
## R    -> recursive
umount -R /mnt

# Shutdow and remove ISO or USB
shutdown now

# Power-off and remove USB booteable
shutdown now

###########################################
# Extra installation after base system ends
###########################################

# Update Packages
pacman -Syu

sudo pacman -S openssh
# +4 -> 225 packages

systemctl start sshd.service
systemctl enable sshd.service

################################################
# In local machine
ssh freddie@ip
################################################

sudo pacman -S xclip
# +1 -> 226 packages

sudo pacman -S xorg
# +87 -> 313 packages
sudo su
echo 'allowed_users = anybody' > /etc/X11/Xwrapper.config
exit

sudo pacman -S xorg-xinit
# +1 -> 314 packages

sudo pacman -S i3-wm
# +28 -> 342 packages

sudo pacman -S i3lock
# +1 -> 343 packages

sudo pacman -S i3status
# +2 -> 345 packages

sudo pacman -S feh
# +7 -> 352 packages

sudo pacman -S xcompmgr
# +2 -> 354 packages

sudo pacman -S rsync
# +1 > 360 packages

time rsync -avz /home/freddie/.ssh/* freddie@${IPNEW}:/home/freddie/.ssh
time rsync -avz /home/freddie/.gnupg/* freddie@${IPNEW}:/home/freddie/.gnupg
time rsync -avz /home/freddie/.wakatime.cfg freddie@${IPNEW}:/home/freddie/.wakatime.cfg

sudo pacman -S git
# +5 > 365 packages

git config --global user.name "Freddie Gar"
git config --global user.email freddie.gar@outlook.com
git config --global core.editor "nvim"

sudo mkdir -p /var/www/html
sudo chown freddie:freddie /var/www/html
sudo chmod 755 /var/www/html
mkdir -p /var/www/html/freddiegar

# Sincronize my settings
cd /var/www/html/freddiegar
git clone --depth=1 https://github.com/freddiegar/services.git
cd services

mkdir -p ~/.config/nvim
ln -s `pwd`/editor/vim/.vimrc ~/.vimrc
ln -s `pwd`/editor/neovim/init.vim ~/.config/nvim/init.vim
ln -s `pwd`/editor/vim/coc-settings.json ~/.config/nvim/coc-settings.json

sudo pacman -S php
# +3 > 368 packages
cd ~
curl -L https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm -Rf composer-setup.php
mkdir -p ~/.config/phpactor
ln -s `pwd`/editor/vim/phpactor.json ~/.config/phpactor/phpactor.json

# Start i3 with startx command
echo 'xrdb -I$HOME ·/.Xresources
exec i3' > ~/.xinitrc

mkdir -p ~/.config/i3
ln -s `pwd`/i3/config ~/.config/i3/config
ln -s `pwd`/i3/status.conf ~/.config/i3/status.conf
ln -s `pwd`/i3/battery ~/.config/i3/battery-popup
ln -s `pwd`/i3/workspace ~/.config/i3/workspace
ln -s `pwd`/i3/lock ~/.config/i3/lock

reboot

mkdir -p /var/www/html/archlinux
cd /var/www/html/archlinux
git clone --depth=1 https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# +1 > 369 packages (go lang)
# +2 > 371 packages

sudo yay -S brave-bin
sudo ln -s `which brave` /usr/bin/brave-browser
# +32 > 403 packages
## Update:  yay -Sua
## Upgrade: sudo pacman -Su
## Remove:  sudo pacman -Rs brave-bin

sudo pacman -S rxvt-unicode ttf-fira-code
# +3 > 406 packages
# +1 > 407 packages
sudo ln -s `pwd`/emulator/urxvt/resize-font /usr/lib/urxvt/perl/resize-font
sudo ln -s `pwd`/emulator/urxvt/config-reload /usr/lib/urxvt/perl/config-reload
ln -s `pwd`/emulator/urxvt/Dark.Xresources ~/.Xdefaults
ln -s `pwd`/emulator/urxvt/Dark.Xresources ~/.Xresources

sudo pacman -S ripgrep
# +1 > 408 packages

sudo pacman -S bat
# +4 > 412 packages

sudo pacman -S fastfetch
# +2 > 414 packages

# images
time rsync -avz /var/www/html/freddiegar/wallpapers freddie@${IPNEW}:/var/www/html/freddiegar/
