[[ $EMACS = t ]] && unsetopt zle

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
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

source ~/.zsh/functions.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/setopts
source ~/.zsh/zstyle


PATH=$PATH:/home/patz/.gem/ruby/2.0.0/bin # ruby on path
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
