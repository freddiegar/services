Install Software in Debian|Ubuntu OS
___

# Performance, not use swap while RAM < 90% used

[Tips 1](https://www.linuxbabe.com/ubuntu/4-tips-speed-up-ubuntu-16-04)

[Tips 2](https://github.com/akalongman/ubuntu-configuration)

```bash
echo '# Overwrite default: 60
vm.swappiness=10' | sudo tee -a /etc/sysctl.d/99-sysctl.conf
```

# Change default time GRUB to 2
```bash
sudo sed -i 's/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=2/g' /etc/default/grub
sudo update-grub
```

# Updated repos
```bash
sudo apt update
sudo apt upgrade
```

# Unzip, cURL, Vim and extra utils
```bash
sudo apt-get install -y unzip
sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y tree
sudo apt-get install -y nmap
sudo apt-get install -y apache2-utils
sudo apt-get install -y htop
## sudo apt-get remove unzip curl vim tree nmap apache2-utils htop && sudo apt-get autoremove
```

# GIT
```bash
sudo apt-get install -y git-core
git config --global user.name "Freddie Gar"
git config --global user.email freddie.gar@outlook.com
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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s `which zsh`
gnome-session-quit
## sudo apt-get remove zsh && sudo apt-get autoremove
```

# Aliases
```bash
touch ~/.bash_aliases
echo 'alias x="exit"
alias ll="ls -l"
alias ct="composer test"
alias cda="composer dump-autoload"
alias vt="vendor/bin/phpunit --stop-on-failure"
alias vtf="vendor/bin/phpunit --stop-on-failure --filter"
alias st="bin/phpunit --stop-on-failure"
alias stf="bin/phpunit --stop-on-failure --filter"
alias update="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
alias dup="docker-compose up -d --build"
alias dconfig="docker-compose config"
alias drm="docker rm -f"
alias dexec="docker exec -it"
alias dlogs="docker logs --tail 50 -f"
alias dstart="docker start"
alias dstop="docker stop"
alias dstatus="docker ps --format \"{{.Names}}\""
alias dphp80="docker exec -it apache80 bash"
alias dphp74="docker exec -it apache74 bash"
alias dphp80a74="docker start apache74 && docker stop apache80"
alias dphp74a80="docker start apache80 && docker stop apache74"
alias ducks="du -cks * | sort -rn | head"
alias gst="git status"
alias gd="git diff -w"
alias gdc="git diff -w --cached"
alias ga="git add"
alias gcmsg="git commit -m"
alias gca="git commit --amend -m"
alias gl="git pull"
' > ~/.bash_aliases
echo 'if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi' >> ~/.zshrc
```

# PHP 7.3
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
## rm -Rf /usr/local/bin/composer
```

# Security Checker
```bash
cd ~
sudo curl -L http://get.sensiolabs.org/security-checker.phar -o /usr/local/bin/security-checker
sudo chmod +x /usr/local/bin/security-checker
## Command: 
## sudo rm /usr/local/bin/security-checker
```

# Code Sniffer Fixer
```bash
cd ~
sudo curl -L https://cs.symfony.com/download/php-cs-fixer-v2.phar -o /usr/local/bin/php-cs-fixer
sudo chmod +x /usr/local/bin/php-cs-fixer
## Command:
## sudo rm /usr/local/bin/security-checker
```

# Mess Detector
```bash
cd ~
sudo curl -L https://github.com/phpmd/phpmd/releases/download/2.9.0/phpmd.phar -o /usr/local/bin/phpmd
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
sudo curl -L https://github.com/infection/infection/releases/download/0.17.5/infection.phar -o /usr/local/bin/infection
sudo chmod +x /usr/local/bin/infection
## Command: 
## infection -j$(nproc) [--filter=file.php]
## Update: 
## infection self-update
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
sudo curl -L https://github.com/phpmetrics/PhpMetrics/releases/download/v2.5.0/phpmetrics.phar -o /usr/local/bin/phpmetrics
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
## sudo apt-get remove docker-engine docker-ce && sudo apt-get autoremove
```

# Docker Compose
```bash
cd ~
sudo curl -L https://github.com/docker/compose/releases/download/1.27.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
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
ssh-keygen                 # Insert passprhase (Algo ...)
ls ~/.ssh
cat ~/.ssh/id_rsa.pub      # Setup SSH Keys in Apps or VPS
```

# Xdebug
```bash
sudo pecl install -f xdebug

echo 'xdebug.idekey=PHPSTORM
xdebug.remote_mode=req
xdebug.remote_host=localhost
xdebug.remote_port=9000
xdebug.remote_enable=1
xdebug.remote_autostart=1
; To enable profiler use XDEBUG_PROFILE=PHPSTORM in (GET|POST|COOKIE)
xdebug.profiler_enable=0
xdebug.profiler_enable_trigger=1
zend_extension=/usr/lib/php/20180731/xdebug.so' | sudo tee /etc/php/7.4/mods-available/xdebug.ini

sudo phpenmod xdebug
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
sudo tar -xvjf firefox.tar.bz2 -C /opt
# sudo tar -xvzf firefox.tar.gz -C /opt
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
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' | sudo tee -a ~/.zshrc
# Close Terminal to load changes
# Show version available
nvm ls-remote
nvm install v12.18.3
# nvm alias default v12.18.3
# nvm current
## Enabled to all users in Ubuntu
# n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
## Install pkg: npm install express
## nvm deactivate && nvm uninstall v10.15.3
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
```

## Ubuntu: Tweak Tool
```bash
gnome-shell --version
sudo apt-get install -y gnome-tweak-tool
## sudo apt-get remove gnome-tweak-tool && sudo apt-get autoremove
```

## Install Xdebug Profiler
```bash
sudo apt-get install -y kcachegrind
## sudo apt-get remove kcachegrind && sudo apt-get autoremove
```

## OBS - Open Broadcasting Software
```bash
sudo apt install -y ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install -y obs-studio
```

## Screen Recording
```bash
sudo apt-get update
sudo apt-get install -y kazam
## sudo apt-get remove kazam && sudo apt-get autoremove
```

## Google Chrome
```bash
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
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

