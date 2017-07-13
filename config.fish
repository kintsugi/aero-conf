set fish_greeting ""
# use vi keybindings like bash vi mode
fish_vi_key_bindings
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

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

# node aliases
alias npmis="npm install --save"
alias npmig="sudo npm install -g"

alias cdvim="cd ~/.vim"
alias gs="git status"
alias gpush="git push"
alias gpull="git pull"
alias gca="git commit -a"
alias gcam="git commit -am"
alias ts="~/ts.sh"

# misc. aliases
# open macvim in fullscreen
alias mvimf="mvim -c \"set fu\""
# start lynx in vi mode
alias vlynx="lynx -vikeys http://google.com"

# setting $PATH
# user tools
set PATH $PATH ~/bin
set PATH $PATH ~/dev/proj/bin

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
    echo $proxy

    npm config set https-proxy http://30883:$pp@proxy-west.aero.org:8080

    # add configuration to git command line tool
    git config --global http.proxy http://30883:$pp@proxy-west.aero.org:8080
    git config --global https.proxy http://30883:$pp@proxy-west.aero.org:8080
    git config --global url."http://".insteadOf git://
end

#set PATH $PATH /Applications/mongodb/bin:$PATH

alias gbpurge 'git branch --merged | grep -Ev "(\*|master|development|staging)" | xargs -n 1 git branch -d'
set -x proxy http://30883:(date +"%a" | tr '[:upper:]' '[:lower:]')@proxy-west.aero.org:8080
set -x http_proxy http://30883:(date +"%a" | tr '[:upper:]' '[:lower:]')@proxy-west.aero.org:8080
set -x https_proxy http://30883:(date +"%a" | tr '[:upper:]' '[:lower:]')@proxy-west.aero.org:8080
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
