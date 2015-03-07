
export GOPATH=$HOME/working/gopath-default
export DOCKER_HOST=tcp://192.168.59.103:2375
 #-------------------------------------------------------------------------------
#                                General Aliases  
# ------------------------------------------------------------------------------
alias bp='v ~/.bash_profile'
alias sbp='source ~/.bash_profile'

alias hosts='sudo v /etc/hosts'

# Flush the DNS -- sometimes helpful after connecting to or disconnecting from VPN
alias flushdns="dscacheutil -flushcache"

alias v='vim' 
alias devnotes="v ~/devtools/config-files/dev_notes.md"

# Don't save repeated commands; don't save commands that start with a space
export HISTIGNORE="&:[ ]*"

# These 3 lines remove duplicates, limit the size, and automatically append when closing a session
export HISTCONTROL=erasedups
export HISTSIZE=10000
#shopt -s histappend

# navigation aliases
poc=/Users/chardt/working/ar/jenga/poc/repos


# -------------------------------------------------------------------------------
#                                 Docker Support 
# -------------------------------------------------------------------------------
# Helpful blog post:
# http://viget.com/extend/how-to-use-docker-on-os-x-the-missing-guide

# returns the docker IP address e.g. usage: curl $(docker-ip):49153
docker-ip() {
  boot2docker ip 2> /dev/null
}
# Execute the following to create 'dockerhost'
# echo $(docker-ip) dockerhost | sudo tee -a /etc/hosts

# Allow docker-enter directly from OS X 
# (without first ssh'ing into boot2docker VM)
docker-enter() {
  boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
  boot2docker ssh -t sudo /var/lib/boot2docker/docker-enter "$@"
}

# -------------------------------------------------------------------------------
#                                  Tmux Aliases 
# -------------------------------------------------------------------------------
alias ta='tmux a -t'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

# -------------------------------------------------------------------------------
#                         NVM (manage Node.js versions)
# -------------------------------------------------------------------------------
if [ -f $HOME/.nvm/nvm.sh ]; then
  source $HOME/.nvm/nvm.sh
  [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
fi

# -------------------------------------------------------------------------------
#                                    TODOs
# -------------------------------------------------------------------------------
# Create alias to 'todo.sh', and configure bash completion to work with this alias
if [ -f $HOME/devtools/config-files/todo.txt-cli/todo.sh ]; then
  alias t="$HOME/devtools/config-files/todo.txt-cli/todo.sh -d ~/devtools/config-files/todo.txt-cli/.todo.cfg"
fi
export TODOTXT_DEFAULT_ACTION=ls
alias todotxt='v ~/Dropbox/todos/todo.txt'
alias todos='todotxt'

# ---------------- ---- SHA1 -----------------------
#  (note: md5 is already available, but sha1 isn't on the path)
alias sha="/usr/bin/openssl sha1"
alias sha1="/usr/bin/openssl sha1"

# -------------------------------------------------------------------------------
#                                      Git
# -------------------------------------------------------------------------------
# (some of these require git aliases as well)
alias gb='git branch --color'
alias gba='git branch -a --color'
alias gd='git diff | v'
alias gi='grep -i'
alias gl='git l'
alias gst='git st'

# -------------------------------------------------------------------------------
#                                  Mac OS X apps 
# -------------------------------------------------------------------------------
alias calc="open -a Calculator"
alias saf="open -a Safari"
alias marked="open -a 'Marked 2'"
alias down="open -a MacDown"

# -------------------------------------------------------------------------------
#                                    Java
# -------------------------------------------------------------------------------
if [ -d /opt/oracle/instantclient ]; then
    # hack -- identifying work computer (because it has oracle)
    export JAVA_OPTS="-XX:MaxPermSize=512m -XX:PermSize=128m -Xms1024m -Xmx3096m -Dhttp.proxyPort=8080 -Dhttp.proxyHost=www-proxy.sct.com -Dhttp.proxyHost=www-proxy.sct.com -Dhttp.proxyPort=8080 -DPROXY_SERVER_NAME=http://m039220:8081/nexus/content/groups/public"
else
    export JAVA_OPTS="-XX:MaxPermSize=512m -XX:PermSize=128m -Xms1024m -Xmx3096m"
fi

# -------------------------------------------------------------------------------
#                                 Scala / SBT
# -------------------------------------------------------------------------------
export SBT_OPTS="-XX:MaxPermSize=512m"

# -------------------------------------------------------------------------------
#                                   Grails
# -------------------------------------------------------------------------------

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
if [ -f $HOME/.gvm/bin/gvm-init.sh ]; then
  [[ -s "$HOME/.gvm/bin/gvm-init.sh" && -z $(which gvm-init.sh | grep '/gvm-init.sh') ]] && source "$HOME/.gvm/bin/gvm-init.sh"
fi

