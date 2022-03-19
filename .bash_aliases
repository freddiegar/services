alias x="exit"
alias v="vim"
alias g="grep"
alias m="man"
alias l="less"
alias t="touch"
alias h="history"
alias d="diff"
alias ll="ls -lh"
alias __="ssh-add"
alias npkg="dpkg --list | wc --lines"

alias vf="vifm"
alias vd="vimdiff"
alias vv="nvim"
alias vz="vim ~/.zshrc"
alias va="vim ~/.bash_aliases"

alias rz="source ~/.zshrc"
alias ra="source ~/.bash_aliases"
alias ri="i3-msg 'restart'"

alias sas="sudo apt-cache search"
alias sad="sudo apt-cache show"
alias sai="sudo apt-get install -y"
alias sar="sudo apt-get remove -y"
alias sau="sudo apt-get update && sudo apt-get upgrade -y && sac"
alias sac="sudo apt-get autoremove --purge -y && sudo apt-get clean -y && sudo apt-get autoclean -y"

alias xpa='echo "\n" | sudo add-apt-repository'
alias xpr='echo "\n" | sudo add-apt-repository --remove'

alias c="composer"
alias c1="composer_v1"
alias ci="composer install"
alias cu="composer update"
alias ct="composer test"
alias cda="composer dump-autoload"
alias cii="composer install --ignore-platform-reqs"
alias cip="composer install --no-dev"

alias pps="php bin/console"
alias ccs="sudo chmod 770 -Rf var                       && sudo chown $USER:www-data -Rf var                      && pps cache:clear"
alias ccm="sudo chmod 770 -Rf var                       && sudo chown $USER:www-data -Rf var                                                && gco var"
alias ppa="php artisan"
alias ccl="sudo chmod 770 -Rf storage bootstrap/cache   && sudo chown $USER:www-data -Rf storage bootstrap/cache  && ppa optimize:clear      && gco storage bootstrap"
alias ppy="export APPLICATION_ENV=dev && php yii"
alias ccy="sudo chmod 770 -Rf runtime web/assets        && sudo chown $USER:www-data -Rf runtime web/assets       && ppy cacle:flush-all"

alias pex="sudo phpenmod xdebug"
alias pdx="sudo phpdismod xdebug"

alias vt="vendor/bin/phpunit --stop-on-failure --no-coverage"
alias vtu="vendor/bin/phpunit --stop-on-failure --no-coverage --testsuite=unit"
alias vtf="vendor/bin/phpunit --stop-on-failure --no-coverage --filter"

alias st="bin/phpunit --stop-on-failure --no-coverage"
alias stu="bin/phpunit --stop-on-failure --no-coverage --testsuite=unit"
alias stf="bin/phpunit --stop-on-failure --no-coverage --filter"

alias ducks="du -cks * | sort -rn | head"
alias fo="/opt/firefox/firefox --new-tab"

alias dexec="docker exec -it"
alias dlogs="docker logs --tail 50 -f"
alias dstart="docker start"
alias dstop="docker stop"
alias dstatus="docker ps --format \"{{.Names}}\""
alias dstats="docker stats"
alias dclean="dcclean && diclean"
alias diclean="docker images | grep ' <none> ' | awk '{print \$3}' | xargs -I {} docker rmi {} && echo 'Images cleaned'"
alias dcclean="docker ps -a | grep ' Exited (1) ' | awk '{print \$1}' | xargs -I {} docker rm  -f {} && echo 'Containers cleaned'"

alias gs="git summary"
alias gi="git init"
alias gt="git tag"
alias gst="git status"
alias gd="git diff -w"
alias gdc="git diff -w --cached"
alias ga="git add"
alias gcm="git commit -S"
alias gcmsg="git commit -S -m"
alias gcmsga="git commit --amend -S -m"
alias gcmsgo="git commit --no-edit -C ORIG_HEAD"
alias gl="git pull"
alias glo="git pull origin"
alias gm="git merge"
alias gmu="git merge upstream/master"
alias gma="git merge --abort"
alias gp="git push"
alias gpo="git push origin"
alias gpa="git push --all"
alias gb="git branch"
alias gbn="git checkout master && git branch -M master && git push -u origin master"
alias gfa="git fetch --all --prune"
alias gfu="git fetch upstream"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcob="git checkout -b"
alias gcot "git checkout version"
alias gsh="git stash"
alias gshp="git stash -p"
alias gsl="git stash list"
alias gsp="git stash pop"
alias gsb="git stash branch"
alias gss="git stash show"
alias grh="git reset HEAD"
alias grH="git reset HEAD~"

alias gff="git flow init -d"
alias gffs="git flow feature start"
alias gfff="git flow feature finish"
alias gfbs="git flow bugfix start"
alias gfbf="git flow bugfix finish"
alias gfhs="git flow hotfix start"
alias gfhf="git flow hotfix finish"
alias gfrs="git flow release start"
alias gfrf="git flow release finish"

alias gh="git blame --date=relative -w -L1"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glop="glog -p"
alias glof="git show --name-only"
alias gconf="git config --list"

alias cdh="cd /var/www/html"
alias cdt="cd /var/www/html/atar"
alias cde="cd /var/www/html/evertec"
alias cdx="cd /var/www/html/flexphp"
alias cdf="cd /var/www/html/freddiegar"

alias cdd="cd /home/$USER/Downloads"

alias wr="convert -resize `xdpyinfo | awk '/dimensions/ {print $2}'`"
alias yy="xclip -selection clipboard"
