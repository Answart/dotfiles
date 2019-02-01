if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Common ENV variables
export EDITOR='atom'
export GIT_EDITOR='atom --wait'
# export SHELL='/bin/zsh'
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/bin"

DISABLE_AUTO_UPDATE="true"

HISTFILE="$HOME/.cache/zsh"

# zsh & oh-my-zsh configuration
ZSH_THEME="answart"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# DISABLE_CORRECTION="false"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-nvm)

# SUBLIME
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# ATOM
alias atom="/Applications/Atom.app/Contents/Resources/app/atom.sh"

# ZSH
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
# alias clear_history='echo "" > ~/.zsh_history & exec $SHELL -l'

# copy/paste pwd
alias cpwd="pwd|pbcopy"
alias ppwd="pbpaste"

# quick folder size
alias kdu="du -h -I '.git' -d 2"

# List port in use
alias openports="sudo lsof -i -P -n | grep LISTEN"

# Morning quick daily working
alias morning="git recent && git standup"

# shortcuts
alias proj="cd ~/Documents/Projects"
alias gh="cd ~/Documents/Projects/github"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FINAL PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:$PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

source $ZSH/oh-my-zsh.sh

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/answart/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Separate path for .zcompdump files
compinit -u -d ~/.cache/zsh/.zcompdump-$USER-$ZSH_VERSION
