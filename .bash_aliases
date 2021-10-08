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

alias vd="vimdiff"
alias vv="nvim"
alias vz="vim ~/.zshrc"
alias va="vim ~/.bash_aliases"

alias rz="source ~/.zshrc"
alias ra="source ~/.bash_aliases"

alias sai="sudo apt-get install -y"
alias sar="sudo apt-get remove -y"
alias sau="sudo apt-get uninstall -y"
alias sac="sudo apt-get autoremove -y && sudo apt-get clean -y && sudo apt-get autoclean -y"

alias c="composer"
alias c1="composer_v1"
alias ci="composer install"
alias cu="composer update"
alias ct="composer test"
alias cda="composer dump-autoload"

alias pa="php artisan"
alias ccs="sudo chmod 770 -Rf var && sudo php bin/console cache:clear && sudo chown freddie:www-data -Rf var && sudo chmod 770 -Rf var"
alias ccm="sudo chmod 770 -Rf var && sudo chown freddie:www-data -Rf var && sudo chmod 770 -Rf var && gco var"
alias ccl="sudo chmod 770 -Rf storage && sudo php artisan cache:clear && php artisan view:clear && sudo chown freddie:www-data -Rf storage && sudo chmod 770 -Rf storage && gco storage"

alias pex="sudo phpenmod xdebug"
alias pdx="sudo phpdismod xdebug"

alias vt="vendor/bin/phpunit --stop-on-failure --no-coverage"
alias vtu="vendor/bin/phpunit --stop-on-failure --no-coverage --testsuite=unit"
alias vtf="vendor/bin/phpunit --stop-on-failure --no-coverage --filter"

alias st="bin/phpunit --stop-on-failure --no-coverage"
alias stu="bin/phpunit --stop-on-failure --no-coverage --testsuite=unit"
alias stf="bin/phpunit --stop-on-failure --no-coverage --filter"

alias ducks="du -cks * | sort -rn | head"
alias update="sudo apt-get update && sudo apt-get upgrade -y && sac"
alias fo="/opt/firefox/firefox --new-tab"

alias dexec="docker exec -it"
alias dlogs="docker logs --tail 50 -f"
alias dstart="docker start"
alias dstop="docker stop"
alias dstatus="docker ps --format \"{{.Names}}\""
alias dstats="docker stats"

alias gs="git summary"
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
alias gfa="git fetch --all --prune"
alias gfu="git fetch upstream"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gcob="git checkout -b"
alias gcot= "git checkout version"
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
alias gconf="git config --list"
alias gh="git blame --date=relative -w -L1"

alias cdt="cd /var/www/html/atar"
alias cdf="cd /var/www/html/freddiegar"
alias cdx="cd /var/www/html/flexphp"
alias cde="cd /var/www/html/evertec"
