
export GOPATH=$HOME/working/gopath-default

# ---------------- General Aliases ---------------
alias bp='v ~/.bash_profile'
alias sbp='source ~/.bash_profile'

alias hosts='sudo v /etc/hosts'

# Flush the DNS -- sometimes helpful after connecting to or disconnecting from VPN
alias flushdns="dscacheutil -flushcache"

alias v='vim' 

# --------------- Tmux Aliases -------------------
alias ta='tmux a -t'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

# Create alias to 'todo.sh', and configure bash completion to work with this alias
if [ -f $HOME/devtools/config-files/todo.txt-cli/todo.sh ]; then
  alias t="$HOME/devtools/config-files/todo.txt-cli/todo.sh -d ~/.todo.cfg"
fi
export TODOTXT_DEFAULT_ACTION=ls
alias todotxt='subl ~/Dropbox/todos/todo.txt'
alias todos='todotxt'

# ---------------- ---- SHA1 -----------------------
#  (note: md5 is already available, but sha1 isn't on the path)
alias sha="/usr/bin/openssl sha1"
alias sha1="/usr/bin/openssl sha1"

# ---------------------- Git ---------------------
# (some of these require git aliases as well)
alias gb='git branch --color'
alias gba='git branch -a --color'
alias gd='git diff | v'
alias gi='grep -i'
alias gl='git l'
alias gst='git st'


# ----------------- Mac OS X apps -----------------
alias calc="open -a Calculator"
alias saf="open -a Safari"
alias marked="open -a Marked"

# Don't save repeated commands; don't save commands that start with a space
export HISTIGNORE="&:[ ]*"

# These 3 lines remove duplicates, limit the size, and automatically append when closing a session
export HISTCONTROL=erasedups
export HISTSIZE=10000
#shopt -s histappend

poc=/Users/chardt/working/ar/jenga/poc/repos

