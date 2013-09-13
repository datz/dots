bindkey -e

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey '^[[Z' reverse-menu-complete

bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

bindkey "^A" beginning-of-line        # Ctrl-a
bindkey "^E" end-of-line        # Ctrl-e
bindkey "^X" insert-sudo        # Ctrl-X

bindkey '^i' expand-or-complete-prefix # completion in the middle of a line


bindkey '\C-x\C-e' edit-command-line


bindkey "^[[1;5C" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "^[[1;5D" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
