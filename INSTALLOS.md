Install Software in Debian|Ubuntu OS
___

# Performance, not use swap while RAM < 90% used

[Tips 1](https://www.linuxbabe.com/ubuntu/4-tips-speed-up-ubuntu-16-04)

[Tips 2](https://github.com/akalongman/ubuntu-configuration)

```bash
echo '# Overwrite default: 60
vm.swappiness=10' | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p
```

# Change default User Max Watches

```bash
sudo cp -p ~/.zshrc ~/.zshrc.original
echo '# Overwrite default: 8192 ~ 8M to ~540M
fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.d/99-sysctl.conf
sudo sysctl -p
```

# Change default time GRUB to 2

```bash
sudo cp -p ~/.zshrc ~/.zshrc.original
sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=2/g' /etc/default/grub
sudo update-grub
```

# Auto-update (on servers)

```bash
sudo apt-get install -y unattended-upgrades update-notifier-common
sudo cp -p ~/.zshrc ~/.zshrc.original
sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Kernel-Packages "false";/Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Remove-Unused-Dependencies "false";/Unattended-Upgrade::Remove-Unused-Dependencies "true";/g' /etc/apt/apt.conf.d/50unattended-upgrades
sudo sed -i 's/\/\/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/Unattended-Upgrade::Automatic-Reboot-Time "02:00";/g' /etc/apt/apt.conf.d/50unattended-upgrades
```

# Disabled IPP Service: 631 (Internet Printer Protocol)

```bash
sudo service cups stop
sudo systemctl disable cups
```

# Vim Latest :D

```bash
sudo add-apt-repository ppa:jonathonf/vim
## sudo apt-get remove vim && sudo add-apt-repository --remove ppa:jonathonf/vim
```

# Updated repos

```bash
sudo apt-get update
sudo apt-get upgrade
```

# Unzip, cURL, Vim and extra utils

```bash
sudo apt-get install -y unzip
sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y tree
sudo apt-get install -y nmap
sudo apt-get install -y htop
sudo apt-get install -y konsole
## sudo apt-get remove unzip curl vim tree nmap htop konsole && sudo apt-get autoremove
```

## Vim Configuration

```bash
# Set as default editor
sudo update-alternatives --config editor

# cp -p .vimrc ~/.vimrc
```

## Vim Plugins

```bash
# Install
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Enable
echo "\" Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
call plug#end()

\" Theme
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set background=dark
" >> ~/.vimrc

# Open vim and run
:PlugInstall

# Update all plugins
:PlugUpdate

# Clean plugins
:PlugClean

# Upgrade plugin manager
:PlugUpgrade
```
> See .vimrc file in root folder

## Vim Copy/Paste (Share SO)

```bash
# Check: +xterm_clipboard
vim --version | grep xterm
# if -xterm_clipboard then
# sudo apt-get install -y vim-gnome
# Check again
```

## RigGrep for Vim search

```bash
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt-get install ripgrep

echo "
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi " >> ~/.zshrc
```

## C Development

### LSP

[See](https://llvm.org/docs/GettingStarted.html#overview)

```bash
cd ~
curl -SL http://releases.llvm.org/9.0.0/clang%2bllvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz | tar -xJC .
mv clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04 clang_9.0.0
sudo mv clang_9.0.0 /usr/local
```

### Ctags

echo "--recurse=yes
--tag-relative=yes
--exclude=.git
--exclude=.idea
--exclude=.vscode
--exclude=composer.phar
--exclude=*.js
--exclude=*.vim
--langmap=php:.engine.inc.module.theme.install.php
--regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i
--PHP-kinds=+cfi-vj
" > ~/.ctags

```bash
# In vim run to generate tags files
# Need: Plug 'vim-scripts/autotags'
Pulse <F4>
```

### PHP Ctags

```bash
cd ~
sudo curl -L https://github.com/vim-php/phpctags/raw/gh-pages/install/phpctags.phar -o /usr/local/bin/phpctags
sudo chmod +x /usr/local/bin/phpctags
## Command:
## phpctags
## sudo rm /usr/local/bin/phpctags
```

## Snippets

```bash
# PHP
mkdir -f ~/.vim/UltiSnips && cp -p php.snippets ~/.vim/UltiSnips/php.snippets
```

## PHPStorm

```bash
# cp -p .ideavimrc ~/.ideavimrc
```

# GIT

```bash
sudo apt-get install -y git-core
git config --global user.name "Freddie Gar"
git config --global user.email freddie.gar@outlook.com
git config --global core.editor "vim"
git config --list
## sudo apt-get remove git-core && sudo apt-get autoremove
```

# GIT Flow

```bash
sudo apt-get install git-flow
## sudo apt-get remove git-flow && sudo apt-get autoremove
```

# Zsh

```bash
sudo apt-get install -y zsh
# As User NOT root
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s `which zsh`

sudo cp -p ~/.zshrc ~/.zshrc.original
sudo sed -i 's/# CASE_SENSITIVE="true"/CASE_SENSITIVE="true"/g' ~/.zshrc
sudo sed -i 's/# HIST_STAMPS="mm\/dd\/yyyy"/HIST_STAMPS="yyyy\/mm\/dd"/g' ~/.zshrc
sudo sed -i 's/plugins=(git)/plugins=()/g' ~/.zshrc

gnome-session-quit
## sudo apt-get remove zsh && sudo apt-get autoremove
```

# Aliases

```bash
cp -p .bash_aliases ~/.bash_aliases

# Enable alias in zsh
echo '
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi' >> ~/.zshrc
```

# Enable alias in Vim
echo '
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi' >> ~/.zshenv
```

# PHP 7.4

```bash
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php # Only Ubuntu
sudo apt-get update
sudo apt-get install -y php7.4-cli
sudo apt-get install -y php7.4-dev
sudo apt-get install -y php7.4-mbstring
sudo apt-get install -y php7.4-mysql
sudo apt-get install -y php7.4-curl
sudo apt-get install -y php7.4-zip
sudo apt-get install -y php7.4-soap
sudo apt-get install -y php7.4-gd
sudo apt-get install -y php7.4-sqlite3
sudo apt-get install -y php7.4-intl
sudo apt-get install -y php7.4-memcached
sudo apt-get install -y php7.4-redis
sudo apt-get install -y php7.4-bcmath
sudo apt-get install -y php7.4-gmp
## sudo apt-get remove php7.4* && sudo apt-get autoremove
```

# MySQL Client (Server is using Docker)

```bash
# Ubuntu
sudo apt-get install -y mysql-client
## sudo apt-get remove mysql-client && sudo apt-get autoremove

# Debian
sudo apt-get install -y mariadb-client
## sudo apt-get remove mariadb-client && sudo apt-get autoremove
```

# Composer

```bash
cd ~
curl -L https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm -Rf composer-setup.php
## Update
## composer self-update
## rm -Rf /usr/local/bin/composer
```

# Rector

[See](https://github.com/rectorphp/rector/blob/main/docs/rector_rules_overview.md)

```bash
cd ~
composer global require rector/rector --dev
sudo ln -s ~/.composer/vendor/bin/rector /usr/local/bin/phprector
## Command
## phprector -c /var/www/html/freddiegar/services/rector.php process src
## phprector -c /var/www/html/freddiegar/services/rector.php -n process src tests
## phprector -c /var/www/html/freddiegar/services/rector.php --no-diffs process src tests
## composer global remove rector/rector
```

# Code Sniffer Fixer

```bash
cd ~
sudo curl -L https://cs.symfony.com/download/php-cs-fixer-v2.phar -o /usr/local/bin/php-cs-fixer
sudo chmod +x /usr/local/bin/php-cs-fixer
## Command:
## php-cs-fixer
## sudo rm /usr/local/bin/php-cs-fixer
```

# Mess Detector

```bash
cd ~
sudo curl -L https://github.com/phpmd/phpmd/releases/download/2.9.1/phpmd.phar -o /usr/local/bin/phpmd
sudo chmod +x /usr/local/bin/phpmd
## Command:
## phpmd source/code format ruleset
## phpmd src ansi cleancode,design,naming,unusedcode
## phpmd src ansi cleancode,codesize,controversial,design,naming,unusedcode
## sudo rm /usr/local/bin/phpmd
```

# Infection AST

```bash
cd ~
sudo curl -L https://github.com/infection/infection/releases/download/0.21.4/infection.phar -o /usr/local/bin/infection
sudo chmod +x /usr/local/bin/infection
## Command:
## infection -j$(nproc) [--filter=file.php]
## sudo rm /usr/local/bin/infection
```

# PHPLOC (Lines Of Code)

```bash
cd ~
sudo curl -L https://phar.phpunit.de/phploc.phar -o /usr/local/bin/phploc
sudo chmod +x /usr/local/bin/phploc
## Command:
## phploc -v --exclude=vendor --ansi .
## sudo rm /usr/local/bin/phploc
```

# PHPCPD (Copy/Paste Dectector)

```bash
cd ~
sudo curl -L https://phar.phpunit.de/phpcpd.phar -o /usr/local/bin/phpcpd
sudo chmod +x /usr/local/bin/phpcpd
## Command:
## phpcpd -vvv --exclude=vendor --ansi --progress .
## sudo rm /usr/local/bin/phpcpd
```

# PHPMetrics

```bash
cd ~
sudo curl -L https://github.com/phpmetrics/PhpMetrics/releases/download/v2.7.3/phpmetrics.phar -o /usr/local/bin/phpmetrics
sudo chmod +x /usr/local/bin/phpmetrics
## Command:
## phpmetrics --excluded-dirs vendor --report-html=./tests/coverage/phpmetrics .
## sudo rm /usr/local/bin/phpmetrics
```

# Docker (Container)

[See 1](https://docs.docker.com/install/linux/docker-ce/ubuntu)

[See 2](https://docs.docker.com/install/linux/linux-postinstall/)

## Ubuntu 18.*, 19.*, Debian 10

```bash
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg software-properties-common
curl -L https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/`lsb_release -is | awk '{print tolower($0)}'` `lsb_release -cs` stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker $(whoami)
gnome-session-quit
## sudo apt-get remove docker-ce && sudo apt-get autoremove
```

## Ubuntu 16.*

```bash
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo usermod -aG docker $(whoami)
sudo reboot
## sudo apt-get remove docker-engine && sudo apt-get autoremove
```

# Docker Compose

```bash
cd ~
sudo curl -L https://github.com/docker/compose/releases/download/1.28.6/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
## sudo rm /usr/local/bin/docker-compose
```

# Docker Network

```bash
docker network create --driver=bridge --subnet=172.20.0.0/16 --gateway=172.20.0.1 development
```

# GIT Summary

```bash
cd ~
sudo apt-get install -y gawk
sudo curl -L https://raw.githubusercontent.com/albenik/git-summary/master/git-summary -o /usr/local/bin/git-summary
sudo chmod +x /usr/local/bin/git-summary
## sudo apt-get remove gawk && sudo rm /usr/local/bin/git-summary && sudo apt-get autoremove
```

# SSH Keys

```bash
ssh-keygen                 # Insert passphrase (Algo ...)
ls ~/.ssh
cat ~/.ssh/id_rsa.pub      # Setup SSH Keys in Apps or VPS
```

# GPG Keys

[See](https://docs.github.com/en/enterprise-server@2.22/github/authenticating-to-github/generating-a-new-gpg-key)

```bash
# Create key
gpg --full-generate-key
> Kind:     RSA and RSA
> Long:     4096
> Time:     1y
> Name:     Freddie Gar
> Mail:     freddie.gar@outlook.com
> Comment:  Personal GPG Key

# List key
gpg --list-secret-keys --keyid-format LONG
> sec   rsa4096/C292DDB5 2021-03-30 [SC] [expires: 2022-03-30]
>       93AA89FC183E5D2A83114F49C6F296FCC292DDB5
> uid         [ultimate] Freddie Gar (Personal GPG Key) <freddie.gar@outlook.com>
> ssb   rsa4096/9567702A 2021-03-30 [E] [expires: 2022-03-30]

# Enable
git config --global commit.gpgsign true
git config --global user.signingkey [ID]

# Use ssb short id: 9567702A, in this example
git config --global user.signingkey 9567702A

# Override by repository
cd git/repository
git config user.signingkey [ID]
```

## Export Public GPG Key (for GitHub example)

[See](https://github.com/settings/keys)

```bash
gpg --armor --export [ID]

# Use sec short id: C292DDB5, in this example
gpg --armor --export C292DDB5
```

# Xdebug

```bash
sudo pecl install -f xdebug-2.9.8

# Xdebug 2
echo 'xdebug.idekey=PHPSTORM
xdebug.remote_mode=req
xdebug.remote_host=localhost
xdebug.remote_port=9003
xdebug.remote_enable=1
xdebug.remote_autostart=1
; To enable profiler use XDEBUG_PROFILE=PHPSTORM in (GET|POST|COOKIE)
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
zend_extension=/usr/lib/php/20190902/xdebug.so' | sudo tee /etc/php/7.4/mods-available/xdebug.ini

sudo pecl install -f xdebug

# Xdebug 3
## Backup v2
sudo cp -p /etc/php/7.4/mods-available/xdebug.ini /etc/php/7.4/mods-available/xdebug.ini.v2
echo 'xdebug.idekey=PHPSTORM
xdebug.mode=debug
xdebug.start_with_request=trigger
xdebug.client_host=host.docker.internal
xdebug.client_port=9003
;xdebug.log=/var/www/html/xdebug/xdebug.log
xdebug.file_link_format=xdebug://%f@%l
zend_extension=/usr/lib/php/20190902/xdebug.so' | sudo tee /etc/php/7.4/mods-available/xdebug.ini

sudo phpenmod xdebug
```

## Upgrade

```bash
# all
sudo pecl upgrade
# or specific
sudo pecl upgrade -f xdebug
```

# Linking

[See](https://xdebug.org/docs/all_settings#file_link_format)

```bash
mkdir ~/bin
echo "#! /bin/sh

f=`echo $1 | cut -d @ -f 1 | sed 's/xdebug:\/\///'`
l=`echo $1 | cut -d @ -f 2`
vim --remote-tab +$l $f
" > ~/bin/ff-xdebug.sh

# Permissions
sudo chmod +x ~/bin/ff-xdebug.sh
```

## Throuble

Maybe need run as `sudo` user! or:

### No releases available for package "pecl.php.net/package"
### Error getting channel info from pear.php.net: Connection to `ssl://pear.php.net:443' failed

```bash
# Update channel
sudo pecl channel-update pecl.php.net

# Update certificates, use default_cert_file path
php -r "print_r(openssl_get_cert_locations());"
sudo curl -fLo /usr/local/ssl/cert.pem http://curl.haxx.se/ca/cacert.pem
```

# Postman

```bash
cd ~
sudo snap install postman
```

# VSCode & Firefox (Dont use snap for this, security risk)

```bash
cd ~/Downloads
sudo dpkg -i vscode.deb

curl -L https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US -o firefox.tar.bz2
sudo tar -xvjf firefox.tar.bz2 -C /opt
# sudo tar -xvzf firefox.tar.gz -C /opt
rm -Rf firefox.tar.bz2
## rm -Rf /opt/firefox
```

## Shortcut for ...

### Firefox Developer Edition

```bash
echo '[Desktop Entry]
Version=1.0
Name=Firefox Web Browser Developer Edition
Comment=Browse the WWW
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web
Exec=/opt/firefox/firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
Actions=new-window;new-private-window;
StartupWMClass=Firefox Developer Edition

[Desktop Action new-window]
Name=Open a New Window
Exec=/opt/firefox/firefox -new-window

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=/opt/firefox/firefox -private-window' > ~/.local/share/applications/firefox.desktop
```

# Node

```bash
cd ~
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.38.0/install.sh | bash
echo '
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' | sudo tee -a ~/.zshrc
# Close Terminal to load changes
# Show version available
nvm ls-remote
nvm install v14.16.0
# nvm alias default v14.16.0
# nvm current
## Enabled to all users in Ubuntu
# n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

## Install package: npm install express
## nvm deactivate && nvm uninstall v10.15.3
```

# Font Fira Code

[See](https://dev.to/josuerodriguez98/installing-firacode-on-windows-and-ubuntu-1fn1)

```bash
# Ubuntu
sudo apt-get install -y fonts-firacode
## sudo apt-get remove fonts-firacode && sudo apt-get autoremove
```

## ST3

Menu -> Preferences -> Settings -> User Settings File

```json
{
    ...
    "font_face": "Fira Code",
    "font_size": 18,
    "font_options": [
        "gray_antialias"
    ],
    "show_encoding": false,
    "show_line_endings": false,
    "default_line_ending": "unix",
    "draw_white_space": "all",
    "translate_tabs_to_spaces": true,
    "word_wrap": false
    ...
}
```

# Clean installation
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove

## That is ALL :D !

# Optionals

## Sublime Text

```bash
cd ~
curl -L https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text
## sudo apt-get remove sublime-text && sudo apt-get autoremove
```

### Vi(ntage) Mode

#### Enable
1. Ctrl + Shift + P: Install Package Control
2. Ctrl + Shift + P: Package Control: Enable Package<Enter>
3. Select Vintage Option

Ready! Vi Layout On :D

#### Disable
1. Ctrl + Shift + P: Package Control: Disable Package<Enter>
2. Select Vintage Option

Ready! Vi Layout Off :(

## Ubuntu: Gnome Tweak Tool

```bash
gnome-shell --version
sudo apt-get install -y gnome-tweak-tool
## sudo apt-get remove gnome-tweak-tool && sudo apt-get autoremove
```

## Ubuntu: Gnome Clocks

```bash
gnome-shell --version
sudo apt-get install -y gnome-clocks
## sudo apt-get remove gnome-clocks && sudo apt-get autoremove
```

## Install Xdebug Profiler

```bash
sudo apt-get install -y kcachegrind
## sudo apt-get remove kcachegrind && sudo apt-get autoremove
```

## OBS - Open Broadcasting Software

```bash
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get install -y ffmpeg obs-studio
## sudo apt-get remove obs-studio ffmpeg
## sudo add-apt-repository -r ppa:obsproject/obs-studio
```

## Screen Recording

```bash
sudo apt-get update
sudo apt-get install -y kazam
## sudo apt-get remove kazam && sudo apt-get autoremove
```

## CPU Usage Bar

```bash
sudo apt-get update
sudo apt-get install -y indicator-multiload
## sudo apt-get remove indicator-multiload && sudo apt-get autoremove
```

## Extensions GUI

```bash
# Clock to right (Frippery Move Clock)
https://extensions.gnome.org/extension/2/move-clock/
# Activities button hidden
https://ubuntuhandbook.org/index.php/2020/03/hide-activities-button-ubuntu-18-04/
```

## Google Chrome

```bash
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -L https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y google-chrome-stable
## sudo apt-get remove google-chrome-stable && sudo apt-get autoremove
```

## Virtual Box

```bash
cd ~
sudo apt-get update
sudo apt-get install virtualbox
## sudo apt-get remove virtualbox && sudo apt-get autoremove
```

## Vagrant (VM)

```bash
sudo apt-get install -y vagrant
## sudo apt-get remove vagrant && sudo apt-get autoremove
```

## Remove LibreOffice

```bash
sudo apt-get remove -y --purge libreoffice* && sudo apt-get clean && sudo apt-get autoremove
```

# Clean installation

```bash
sudo apt-get autoremove -y && sudo apt-get autoclean -y
```
