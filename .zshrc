# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'
zstyle :compinstall filename '/home/galexander/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh.d/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
 # End of lines configured by zsh-newuser-install

# Initialize Colors
autoload -U colors && colors

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# Autoload zsh functions.
fpath=(~/.zsh.d/functions $fpath)
autoload -U ~/.zsh.d/functions/*(:t)

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

PROMPT=$'%{${fg[green]}%}[%h] %m:%~%B$(prompt_git_info)
%{${fg[green]}%}>%b%{${fg[default]}%} '

function ws () { cd $(ruby $NETPAGE_TOOLS/ws.rb $@); }
function wsp () { ruby $NETPAGE_TOOLS/ws.rb $@ }
function pman () { $HOME/bin/pman.sh $@ }

# Clojure configuration
export CLOJURE_EXT=~/.clojure
export PATH=$PATH:~/dev/github/clojure-contrib/launchers/bash

# Aliases
alias ls='ls -FGH'
alias ll='ls -la'
alias man=pman
alias ec=emacsclient
alias clj=clj-env-dir

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
