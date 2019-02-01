#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcre='docker-compose restart'
alias dce='docker-compose exec'
alias dcr='docker-compose run --rm'
alias dcb='docker-compose build'

alias g='git'
alias gs='git status'
alias gst='git stash'
alias ga='git add'
alias gr='git reset'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gcl='git clone'
alias gch='git checkout'
alias gd='git diff'
alias gm='git merge'

alias c='composer'
alias cu='composer update'
alias csu='composer self-update'
alias ci='composer install'
alias cr='composer require'


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
