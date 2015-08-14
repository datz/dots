[[ $EMACS = t ]] && unsetopt zle

# Check if is session is opened by ssh-logins
[ "$SSH_CONNECTION" -a "$SSH_TTY" -eq $(tty) ] && eval $(gpg-agent --daemon) && export GPG_TTY=$(tty)

autoload -Uz compinit promptinit colors insert-sudo edit-command-line

compinit
promptinit
colors


zstyle :compinstall filename '$HOME/.zshrc'

WORDCHARS="${WORDCHARS:s#/#}"

zle -N forward-word-match
zle -N backward-word-match
zle -N insert-sudo insert_sudo
zle -N edit-command-line


# LSCOLORS/LS_COLORS

export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";
export  LSCOLORS="ExGxFxDxCxDxDxhbhdacEc";

# Grep options
#
export GREP_COLOR='1;32'

source ~/.zsh/functions.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/setopts
source ~/.zsh/zstyle

EDITOR="emacs -nw -q"

PATH=$PATH:/home/patz/.gem/ruby/2.0.0/bin:$HOME/opt/storm-0.8.2/bin

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/home/patz/.gem/ruby/2.1.0/bin
PATH=$PATH:/opt/storm/bin
PATH=$HOME/bin:$PATH

export CHROME_BIN=google-chrome-stable

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

export PATH="/home/patz/.cask/bin:$PATH"

export PATH=$PATH:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools:$HOME/.gem/ruby/2.2.0/bin
