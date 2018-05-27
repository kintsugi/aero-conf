set fish_greeting ""
# use vi keybindings like bash vi mode
fish_vi_key_bindings
# env vars
set -x EDITOR vim

# docker aliases
alias dl="docker logs"
alias dlf="docker logs -f"

# aliases for opening/loading config files
# open vimrc
alias vimrc="vim ~/.vimrc"
alias mvimrc="mvim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"

# open fish config file
alias vimfish="vim ~/.config/fish/config.fish"
alias mvimfish="mvim ~/.config/fish/config.fish"
alias nvimfish="nvim ~/.config/fish/config.fish"

# open tmux config file
alias vimtmux="vim ~/.tmux.conf"
alias tmuxnvim="~/tmux-vim.sh"
alias tmuxutil="~/tmux-util.sh"

# reload config file
alias reloadfish="source ~/.config/fish/config.fish"
alias reloadtmux="tmux source-file ~/.tmux.conf"
alias viminstall="vim +PlugInstall +qall"
alias nviminstall="nvim +PlugInstall +qall"

# directory aliases
alias cdp="cd ~/dev/proj/"
alias rmrf="rm -rf"
alias cdvb="cd ~/.vim/bundle"
alias cdnvb="cd ~/.nvim/bundle"
alias cdweb="cd /Library/WebServer/Documents"
alias cdwork="cd /Library/WebServer/Documents/workspace"
alias cdrest="cd /Library/WebServer/Documents/aerorest"


# node aliases
alias npmis="npm install --save"
alias npmig="sudo npm install -g"

alias cdvim="cd ~/.vim"
alias gs="git status"
alias gpush="git push"
alias gpull="git pull"
alias gc="git checkout"
alias gca="git commit -a --verbose"
alias gcam="git commit -am"
alias ts="~/ts.sh"

# misc. aliases
alias v="vim"
# open macvim in fullscreen
alias mvimf="mvim -c \"set fu\""
# start lynx in vi mode
alias vlynx="lynx -vikeys http://google.com"
alias fix="fuck"
alias phinx="vendor/bin/phinx"
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
# setting $PATH
# user tools
set PATH $PATH ~/bin
set PATH $PATH ~/dev/proj/bin
set PATH $PATH /opt/local/bin
set PATH $PATH /opt/local/sbin

# Eclipse path (rarely used for homework)
set -x ECLIPSE_HOME /Users/terminull/dev/tools/Eclipse.app/Contents/Eclipse

#PATH
#set -x PATH $PATH "/usr/local/mysql/bin:$PATH"

function setproxy
    read -i -P "Enter today's proxy password: " pp

    set -e proxy 
    set -e http_proxy 
    set -e https_proxy
    set -xU proxy http://30883:$pp@proxy-west.aero.org:8080/
    set -xU http_proxy http://30883:$pp@proxy-west.aero.org:8080/
    set -xU https_proxy http://30883:$pp@proxy-west.aero.org:8080/

    npm config set https-proxy http://30883:$pp@proxy-west.aero.org:8080

    # add configuration to git command line tool
    git config --global http.proxy http://30883:$pp@proxy-west.aero.org:8080
    git config --global https.proxy http://30883:$pp@proxy-west.aero.org:8080
    git config --global url."http://".insteadOf git://
end

function clearproxy
    set -e proxy 
    set -e http_proxy 
    set -e https_proxy

	npm config rm proxy
	npm config rm https-proxy

	git config --global --remove-section http
	git config --global --remove-section https
	git config --global --remove-section url."http://"
end

#set PATH $PATH /Applications/mongodb/bin:$PATH

alias gbpurge 'git branch --merged | grep -Ev "(\*|master|development|staging)" | xargs -n 1 git branch -d'
#set -x proxy http://30883:(date +"%a" | tr '[:upper:]' '[:lower:]')@proxy-west.aero.org:8080
#set -x http_proxy http://30883:(date +"%a" | tr '[:upper:]' '[:lower:]')@proxy-west.aero.org:8080
#set -x https_proxy http://30883:(date +"%a" | tr '[:upper:]' '[:lower:]')@proxy-west.aero.org:8080

abbr --add gcf 'git checkout feature/ES-'
abbr --add gcb 'git checkout bugfix/ES-'
abbr --add gcd 'git checkout development'
abbr --add gfbso 'git checkout feature/fbso'
abbr --add goct 'git checkout feature/oct'
abbr --add gcrr 'git checkout feature/conference-room-reservation'

thefuck --alias | source

alias ssh-dev="ssh -t ks30883@docker-iiwd1.aero.org 'code-dev'"
alias ssh-qa="ssh -t ks30883@docker-iiwd1.aero.org 'code-qa'"
alias ssh-stage="ssh -t ks30883@docker-iiws1.aero.org 'code-stage'"
alias ssh-pilot1="ssh -t ks30883@docker-iiwd1.aero.org 'code-pilot1'"
alias ssh-pilot2="ssh -t ks30883@docker-iiwd1.aero.org 'code-pilot2'"
alias ssh-prod="ssh -t ks30883@docker-iiwp3.aero.org 'code-prod'"
