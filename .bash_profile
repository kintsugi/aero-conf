#PATH
export PATH="/usr/local/mysql/bin:$PATH"

function setproxy()
{
	read -s -p "Enter today's proxy password: " pp

	export proxy=http://30883:$pp@proxy-west.aero.org:8080/
	export http_proxy=http://30883:$pp@proxy-west.aero.org:8080/
	export https_proxy=http://28660:$pp@proxy-west.aero.org:8080/

	npm config set proxy http://30883:$pp@proxy-west.aero.org:8080
	npm config set https-proxy http://30883:$pp@proxy-west.aero.org:8080

	# add configuration to git command line tool
	git config --global http.proxy http://30883:$pp@proxy-west.aero.org:8080
	git config --global https.proxy http://30883:$pp@proxy-west.aero.org:8080
	git config --global url."http://".insteadOf git://

}



export PATH=/Applications/mongodb/bin:$PATH

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias gbpurge='git branch --merged | grep -Ev "(\*|master|development|staging)" | xargs -n 1 git branch -d'