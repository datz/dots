autoload -Uz compinit promptinit colors insert-sudo
compinit
promptinit
colors


zstyle :compinstall filename '/home/patz/.zshrc'

zle -N forward-word-match
zle -N backward-word-match
zle -N insert-sudo insert_sudo


# LSCOLORS/LS_COLORS

 LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";
 LSCOLORS="ExGxFxDxCxDxDxhbhdacEc";

source ~/.zsh/bindkeys
source ~/.zsh/exports
source ~/.zsh/prompt.zsh
source ~/.zsh/functions
source ~/.zsh/aliases
source ~/.zsh/setopts
source ~/.zsh/zstyle
