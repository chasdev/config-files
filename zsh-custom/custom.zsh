
export TNS_ADMIN=$HOME/devtools/sqlplus-connection
export GOPATH=$HOME/working/gopath-default

export VISUAL=vim

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

# run 'portainer' UI for Docker
alias dockerui="docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer"

# Don't save repeated commands; don't save commands that start with a space
export HISTIGNORE="&:[ ]*"

# These 3 lines remove duplicates, limit the size, and automatically append when closing a session
export HISTCONTROL=erasedups
export HISTSIZE=10000
#shopt -s histappend

# navigation aliases
alias repos="cd ~/working/ar/platform/repos"

# -------------------------------------------------------------------------------
#                               AWS Credentials Support
# -------------------------------------------------------------------------------
# The 'sts' executable (written by Shane in Go) is used to interact with Okta
# using normal domain credentials, and creates a 'setaws' that needs to be
# sourced.  Note the sts exec also needs the accounts.yml file. The exec and the
# yml file are in ~/bin, and the aws credentials file is in ~/.aws (and this is
# updated with SAML info by sts).
#
# This function executes sts and then sources the setaws file (which creates the
# normal AWS credential environment variables needed by the aws-sdk)
#
function sts() {
  ~/bin/sts $@ --outputDir=/Users/chardt/bin && source /Users/chardt/bin/setaws
}

# ------------------------------------------------------------------------------
#                                  iTerm2 Banner
# ------------------------------------------------------------------------------
function setdesc() {
  eval `export shellName=$1`
}

iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
  iterm2_set_user_var shellName=$1
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
  alias t="$HOME/devtools/config-files/todo.txt-cli/todo.sh -d $HOME/devtools/config-files/todo.txt-cli/todo.cfg"
fi
export TODOTXT_DEFAULT_ACTION=ls
alias todotxt='v $HOME/Dropbox/todos/todo.txt'
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

