

# -------------------------------------------------------------------------------
#                                      Aliases
# -------------------------------------------------------------------------------

# ---------------- General Aliases ---------------
alias bp='v ~/.bash_profile'
alias sbp='source ~/.bash_profile'

alias hosts='sudo v /etc/hosts'

# Flush the DNS -- sometimes helpful after connecting to or disconnecting from VPN
alias flushdns="dscacheutil -flushcache"

# --------------- Tmux Aliases -------------------
alias ta='tmux a -t'
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias tl='tmux ls'

# Create alias to 'todo.sh', and configure bash completion to work with this alias
alias t='/Users/chas/devtools/ginatrapani-todo.txt-cli-da68336/todo.sh -d ~/.todo.cfg'
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

# ----------------- command line -----------------

#correct the typos in the cd command automatically
shopt -s cdspell

# add a lot of (albeit redundant) aliases to allow easy navigation
alias ..="cd .."
alias cd..="cd .."

alias ...="cd ../.."
alias ..2="cd ../.."
alias cd..2="cd ../.."

alias ....="cd ../../.."
alias ..3="cd ../../.."
alias cd..3="cd ../../.."

alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias gi="grep -i"
alias l="ls -G"
alias ls="ls -G"
alias la="ls -laG"
alias lm="ls -laG | more"
alias lf="ls -FG"

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

alias h=history
alias hm="history | more"

# ----------------- file find ---------------------
alias ff="find . -type f -name "
# find ./ -cmin -1 <--- finds all files changed in the last minute

# -------------------- VIM / MacVim ---------------

alias v="vim -N"
alias devnotes="v ~/devtools/config-files/dev_notes.md"

# ----------------- Mac OS X apps -----------------
alias calc="open -a Calculator"
alias saf="open -a Safari"
alias marked="open -a Marked"

# ------------------- Projects --------------------
alias rp='cd ~/working/rails_projects'
alias np='cd ~/working/js_projects/node_projects'
alias rat='cd ~/working/js_projects/node_projects/rat'

alias r='rails'
alias g='grails'

# -------------------------------------------------------------------------------
#                                 History
# -------------------------------------------------------------------------------

# Don't save repeated commands; don't save commands that start with a space
export HISTIGNORE="&:[ ]*"

# These 3 lines remove duplicates, limit the size, and automatically append when closing a session
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend


# -------------------------------------------------------------------------------
#                            Bash completion for Git
# -------------------------------------------------------------------------------
# Note: this does not work when using the Git aliases below, but only when using
# the normal 'git co xyz' commands.

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

# -------------------------------------------------------------------------------
#                            Bash completion for 'todo.sh'
# -------------------------------------------------------------------------------
if [ -f /Users/chas/devtools/ginatrapani-todo.txt-cli-da68336/todo_completion ]; then
  source /Users/chas/devtools/ginatrapani-todo.txt-cli-da68336/todo_completion
  complete -F _todo t
fi


# -------------------------------------------------------------------------------
#                            Bash completion for 'tmux'
# -------------------------------------------------------------------------------
if [ -f /usr/local/Cellar/tmux/1.8/etc/bash_completion.d/tmux ]; then
  source /usr/local/Cellar/tmux/1.8/etc/bash_completion.d/tmux
fi


# -------------------------------------------------------------------------------
#                                 Terminal Colors
# -------------------------------------------------------------------------------

# LSCOLOR uses 11 foreground:background pairs, representing:
# directory
# symbolic link
# socket
# pipe
# executable
# block special
# character special
# executable with setuid bit set
# executable with setgid bit set
# directory writable to others, with sticky bit
# directory writable to others, without sticky bit

# These characters are used in LSCOLORS to specify colors for each pair
# a  black
# b  red
# c  green
# d  brown
# e  blue
# f  magenta
# c  cyan
# h  light grey
# A  block black, usually shows up as dark grey
# B  bold red
# C  bold green
# D  bold brown, usually shows up as yellow
# E  bold blue
# F  bold magenta
# G  bold cyan
# H  bold light grey; looks like bright white
# x  default foreground or background
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


# -------------------------------------------------------------------------------
#                                     Prompt
# -------------------------------------------------------------------------------

# Put full path in title bar (so prompt doesn't have to be so long)
# Note: This line must be typed using these instructions: http://www.macworld.com/article/50257/2006/04/bashprompt.html
# (Note: this isn't working, hence it is commented out -- leaving it for reference.)
#export PROMPT_COMMAND='echo -n "]1;$PWD"'

# Limit the length of the path shown in the prompt
function prompt_command {
  #   How many characters of the $PWD should be kept
  local pwd_length=23
  if [ $(echo -n $PWD | wc -c | tr -d " ") -gt $pwd_length ]
    then newPWD="$(echo -n $PWD | sed -e "s/.*\(.\{$pwd_length\}\)/\1/")"
    else newPWD="$(echo -n $PWD)"
  fi
}
PROMPT_COMMAND=prompt_command
export PROMPT_COMMAND


# function provides git branch identification
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

# Available prompt colors - use these when setting 'PS1' (which sets the prompt)
BLUE="\[\033[0;34m\]"
BOLD_BLUE="\[\033[1;31m\]"
CYAN="\[\033[0;36m\]"
BOLD_CYAN="\[\033[1;36m\]"
RED="\[\033[0;31m\]"
BOLD_RED="\[\033[1;31m\]"
PURPLE="\[\033[0;35m\]"
BOLD_PURPLE="\[\033[1;35m\]"
YELLOW="\[\033[0;33m\]"
BOLD_YELLOW="\[\033[1;33m\]"
LTGRAY="\[\033[0;37m\]"
DARKGRAY="\[\033[1;30m\]"
WHITE="\[\033[1;37m\]"
BLACK="\[\033[0;30m\]"
GREEN="\[\033[0;32m\]"
ORIGINAL="\[\033[0m\]"
DEFAULT="\[\033[0;39m\]"

LPS1="$CYAN\$(date +%H:%M) \${newPWD} $BOLD_YELLOW\$(parse_git_branch)$DEFAULT\$ "
SPS1="\`if [ \$? = 0 ]; then echo -e '$GREEN\xE2\x98\xBA'; else echo -e '$RED\xE2\x98\xB9'; fi\` \[\e[01;34m\]\[\e[00m\]"

PS1="$LPS1"

alias sp="export PS1=\$SPS1"
alias spro="export PS1=\$SPS1"
alias sprompt="export PS1=\$SPS1"
alias lprompt="export PS1=\$LPS1"
alias lpro="export PS1=\$LPS1"


# -------------------------------------------------------------------------------
#                                    MongoDB
# -------------------------------------------------------------------------------
alias mongostart='mongod run --config /usr/local/Cellar/mongodb/2.0.0-x86_64/mongod.conf'


# -------------------------------------------------------------------------------
#                                 Oracle Sqlplus
# -------------------------------------------------------------------------------
# ORACLE SQL PLUS ENV VARIABLES 
if [ -d /opt/oracle/instantclient ]; then
  export ORACLE_HOME=/opt/oracle/instantclient 
  export NLS_LANG="AMERICAN_AMERICA.UTF8" 
  export DYLD_LIBRARY_PATH=$ORACLE_HOME
  export TWO_TASK=oracledb:1521/BAN83
fi


# -------------------------------------------------------------------------------
#                                    Rails
# -------------------------------------------------------------------------------

# RVM -- use rvm help to see list of commands. Used to switch among ruby versions and gem sets
#if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi
#[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function


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
#                                   Grails
# -------------------------------------------------------------------------------

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
if [ -f $HOME/.gvm/bin/gvm-init.sh ]; then
  [[ -s "$HOME/.gvm/bin/gvm-init.sh" && -z $(which gvm-init.sh | grep '/gvm-init.sh') ]] && source "$HOME/.gvm/bin/gvm-init.sh"
fi

