export PATH="$PATH:/usr/local/mysql/bin"

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

eval "$(rbenv init -)"
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export ANDROID_HOME=/usr/local/opt/android-sdk
PATH="~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:${PATH}"
export PATH

# tmuxinator
export EDITOR='vim'
source ~/.bin/tmuxinator.bash

export PATH=/usr/local/bin:/usr/local/share/python:$PATH
export PATH=$PATH:/usr/local/bin/node
export PATH=$PATH:/usr/local/bin/npm
export PATH=$PATH:/usr/local/bin/grunt
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/Cellar/mongodb
export PATH=$PATH:/usr/local/Cellar/phantomjs
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export PATH=/usr/localbin:/usr/local/sbin:$PATH:/Users/jw/bin

export WORKON_HOME=$HOME/.virtualenvs
source "$(which virtualenvwrapper.sh)"
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# mkdir, cd into it
mkcd () {
mkdir -p "$*"
cd "$*"
}

cdl () {
cd "$@" && lsa;
}

##########
# matrix #
#
########
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'

##########
## tree ##
##########
## example ...
#|____Cycles
#| |____.DS_Store
#| |____CyclesCards.json
#| |____Carbon
#| | |____Carbon.json
# alternate: alias tree='find . -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g"'
# use$ tree ; tree . ; tree [some-folder-path]
function tree {
    find ${1:-.} -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}



parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Hamburger shell
# export PS1="\u@\h\w $ "
# export PS1=" 😻  \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] "
export PS1=" 😸  \w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \"\")\$(parse_git_branch)\[$txtred\]\$git_dirty\[$txtrst\] \$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

alias bp='vi ~/.bash_profile'
alias sp='source ~/.bash_profile'

# Node_env
alias nv='. env/bin/activate && cd ~/env' 
alias nonv='deactivate_node'

# Easy navigation
alias up='cd ..; ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd --'
alias ls='ls -l -G'
alias lsa='ls -a -G'

# Git shortcuts
alias gs='git status'
alias ga='git add .'
alias gcam='git commit -am'
alias gaga='ga; gcam'
alias gm='git push origin master'
alias go='gm; git push heroku master'
alias gg='git pull'

# React Native shortcuts
alias rnxcode='open ios/*.xcodeproj'
alias rnandroid='open -a /Applications/Genymotion.app/Contents/MacOS/player.app --args --vm-name "eeb1ef69-965c-439f-aa24-1b8765233855"'
alias vboxmgr='/Applications/VirtualBox.app/Contents/MacOS/VBoxManage'
alias rncp='react-native bundle --platform ios --entry-file index.ios.js --bundle-output ./release/main.jsbundle --dev false'

# Heroku shortcuts
alias hc='heroku run python manage.py collectstatic --noinput'
alias hl='heroku logs --tail'
alias hs='heroku run python manage.py shell'

# Declares
DB='Dropbox'
SO="SpiderOak\ Hive"
GD="Google\ Drive"

# Work directory shortcuts
_P='_Projects'
_W='_Works'

alias P="cd ~/$_P && lsa"
alias W="cd ~/$_W && lsa"

alias techshop="cd ~/Techshop && lsa"
alias knowledge="cd ~/Knowledge && lsa"
alias mobile="cd ~/Techshop/mobile && lsa"

# Bootstrap docs
alias bsdocs="open ~/Techshop/Bootstrap-3-Offline-Docs/index.html"

# PROJECTS
alias wwinery="cd ~/$_W/WhichWinery/www && lsa"
alias wwineryserver="workon winery && wwinery && cd src && ./manage.py runserver 8000"
alias wwinerycode="workon winery && wwinery && ls && git branch && sublime ."

alias breakfast="cd ~/$_P/Breakfast && lsa"
alias breakfastapp="cd ~/$_P/Breakfast && grunt serve"
alias breakfastcode="cd ~/$_P/Breakfast && ls && git branch && sublime ."

alias prnt="cd /Users/jw/_Works/PRNT\ Mobile\ app/Code && lsa"

# Cloud
alias gd='cd ~/$GD && lsa'
alias db='cd ~/$DB && lsa'
alias so='cd ~/$SO && lsa'

# Operation shortcuts
alias g='git'
alias h='history'
alias j='jobs'
alias o='open'
alias oo='open .'

# Time
alias week='date +%V'
alias clock='date +%T'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS
alias whois='whois -h whois-servers.net'

# Flush directory service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ROT13-encode text. Works for decoding, too! ;)
alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
