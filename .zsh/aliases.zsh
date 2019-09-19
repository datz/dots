alias mmv="noglob zmv -W"
alias p="sudo pacman -S"
alias y="yay -S"
alias yy="yay --noconfirm -S"
alias yupdate="yay -Syua --noconfirm"
alias runing="ps aux | grep"
alias la="ls -a"
alias fptz="ssh fptz"
alias kvimclj="ps aux | grep -v grep | grep vimclojure | awk '{print \$2}' | xargs kill"
alias u2d="yay -Syua --noconfirm"
alias e="emacs -nw"
alias se="sudo emacs -nw"
alias sf="show_file"
alias maxram="ps aux --sort -rss"
alias eq="emacs -Q -nw"
alias vim="eq"
alias sudo="sudo "

## wow! such commit
alias such=git
alias very=git
alias wow='git status'

##ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls --color -hG' #I like color
alias l='ls -lFh'     #size,show type,human readable
alias ll='ls -alhG'
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

##cd, because typing the backslash is ALOT of work!!
alias pd='popd'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias -g X='|xargs'
alias -g G='|grep'
alias -g L='|less'
alias -g S='&> /dev/null &'

alias -s {clj,el}="emacs -nw"
alias -s {html,xml}="google-chrome-stable"
alias -s {README,md,txt}="show_file"


alias skype='xhost +local: && sudo -u skype /usr/bin/skype skype --disable-cleanlooks'
