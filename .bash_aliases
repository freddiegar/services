# Dynamic Docker Run (based in current path)
drun() {
    docker exec -w `pwd` -it "$@"
}

grepx() {
    if [ -x "`which rg`" ]; then
        rg "$@"

        return
    fi

    grep "$@"
}

# Dynamic PHP Version (based in current composer.json)
phpx() {
    if [ -f composer.json ]; then
        `cat composer.json | grepx -F '"php":' | sed -r "s#([^0-9]+)# #g" | awk '{print "/usr/bin/php"$1"."$2}'` "$@"

        return
    fi

    `which php` "$@"
}

alias x="exit"
alias v="vim"
alias g="grepx"
alias m="man"
alias l="less"
alias t="touch"
alias h="history"
alias d="diff"
alias f="fzf"
alias a="alias"
alias o="xargs -t -r -I {}"
alias di="diff -rq --suppress-common-lines"
alias ll="ls -lh"
alias __="ssh-add"
alias rga="rg --no-ignore --hidden --glob '!{.git,*.log,*-lock.json,*.lock,var/*,storage/*,node_modules/*,*/var/*,*/storage/*,*/node_modules/*}'"
alias npkg="dpkg --list | wc --lines"

alias vf="vifm"
alias vd="vimdiff"
alias vv="nvim"
alias vn="vim -u NONE"
alias vz="vim ~/.zshrc"
alias va="vim ~/.bash_aliases"
alias v3="vim ~/.config/i3/config"
alias vl="vim -c \"colorscheme morning\""

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

alias c="phpx `which composer`"
alias c1="phpx `which composer_v1`"
alias ci="phpx `which composer` -vvv install"
alias cu="phpx `which composer` -vvv update"
alias ct="phpx `which composer` test"
alias cda="phpx `which composer` -vvv dump-autoload"
alias cii="phpx `which composer` -vvv install --ignore-platform-reqs"
alias cui="phpx `which composer` -vvv update --ignore-platform-reqs"
alias cip="phpx `which composer` -vvv install --no-dev"
alias cin="phpx `which composer` -vvv install --no-cache"
alias cipn="phpx `which composer` -vvv install --no-dev --no-cache"

alias pps="phpx bin/console"
alias ccs="sudo chmod 770 -Rf var                       && sudo chown $USER:www-data -Rf var                      && pps cache:clear"
alias ccm="sudo chmod 770 -Rf var                       && sudo chown $USER:www-data -Rf var                                                && gco var"

alias ppa="phpx artisan"
alias ccl="sudo chmod 770 -Rf storage bootstrap/cache   && sudo chown $USER:www-data -Rf storage bootstrap/cache  && ppa optimize:clear     && gco storage bootstrap"

alias ppv='ppa app-version:create --sha="$(git rev-parse HEAD)" --time="$(date -u +%Y%m%d%H%M%S)" --branch="$(git rev-parse --abbrev-ref HEAD)"'
alias ppy="export APPLICATION_ENV=dev && phpx yii"
alias ccy="sudo chmod 770 -Rf runtime web/assets        && sudo chown $USER:www-data -Rf runtime web/assets       && ppy cache/flush-all"

alias pex="sudo phpenmod xdebug"
alias pdx="sudo phpdismod xdebug"
alias psw="sudo update-alternatives --config php"

alias vt="phpx vendor/bin/phpunit --stop-on-failure --no-coverage"
alias vtu="phpx vendor/bin/phpunit --stop-on-failure --no-coverage --testsuite=unit"
alias vtf="phpx vendor/bin/phpunit --stop-on-failure --no-coverage --filter"

alias vp="phpx vendor/bin/pest --stop-on-failure --no-coverage"
alias vpu="phpx vendor/bin/pest --stop-on-failure --no-coverage --testsuite=unit"
alias vpf="phpx vendor/bin/pest --stop-on-failure --no-coverage --filter"

alias st="phpx bin/phpunit --stop-on-failure --no-coverage"
alias stu="phpx bin/phpunit --stop-on-failure --no-coverage --testsuite=unit"
alias stf="phpx bin/phpunit --stop-on-failure --no-coverage --filter"

alias ducks="du -cks * | sort -rn | head"
alias fo="/opt/firefox/firefox --new-tab"

alias dexec="docker exec -it"
alias dlogs="docker logs --tail 50 -f"
alias dstart="docker start"
alias dstop="docker stop"
alias dstatus="docker ps --format \"{{.Names}}\""
alias dprune="docker system prune -a"
alias dstats="docker stats"
alias dclean="dcclean && diclean"
alias diclean="docker images | grep ' <none> ' | awk '{print \$3}' | xargs -r -I {} docker rmi {} && echo 'Images cleaned'"
alias dcclean="docker ps -a | grep ' Exited (1) ' | awk '{print \$1}' | xargs -r -I {} docker rm  -f {} && echo 'Containers cleaned'"

alias gs="git summary"
alias gv="git summary | grep -F ' v' | grep -v -F '/ro-'"
alias gV="git summary | grep -F ' ^' | grep -v -F '/ro-'"
alias gi="git init"
alias gt="git tag"
alias gst="git status"
alias gsts="git status --short"
alias gls="git ls-files"
alias glsm="git ls-files --modified"
alias glsd="git ls-files --deleted"
alias glso="git ls-files --others"
alias glsf="git ls-files --full-name"
alias glsu="git ls-files --others --exclude-standard"
alias glss="git diff --name-only --cached | xargs -r -l echo"
alias glsa="git ls-files -v | rg '^h ' | awk '{print \$2}'"

alias gd="git diff -w"
alias gdc="git diff -w --cached"
alias ga="git add"
alias gcm="git commit -S"
alias gcmn="git commit --no-verify -S"
alias gcmsg="git commit -S -m"
alias gcmsgn="git commit --no-verify -S -m"
alias gcmsga="git commit --amend -S -m"
alias gcmsgan="git commit --no-verify --amend -S -m"
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
alias gbc="git branch --merged | grep -i -v -E \"master|main|develop\" | xargs -r git branch -d"
alias gbn="git checkout master && git branch -M master && git push -u origin master"
alias ggc="git gc --prune=now"
alias gfa="git fetch --all --prune"
alias gfu="git fetch upstream"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcob="git checkout -b"
alias gcot="git checkout version"
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

alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glop="glog -p"
alias glol="git show --name-only"
alias glof="git log --decorate=full --pretty=full --graph -b --stat"
alias glos="git log --show-signature"
alias gconf="git config --list"

alias cdh="cd /var/www/html"
alias cdt="cd /var/www/html/ataringenieria"
alias cde="cd /var/www/html/evertec"
alias cdx="cd /var/www/html/flexphp"
alias cdf="cd /var/www/html/freddiegar"

alias cdd="cd /home/$USER/Downloads"

alias wr="convert -resize `xdpyinfo | awk '/dimensions/ {print $2}'`"
alias yy="xclip -selection clipboard"

# Last command BUT as sudo, need simple quotes!
# @see https://unix.stackexchange.com/a/158480
# alias pls='sudo $(fc -ln -1)'

# Expand alias after sudo
# @see https://stackoverflow.com/a/37210013
# alias sudo="sudo "
