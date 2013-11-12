alias p="sudo pacman -S"
alias y="yaourt -S"
alias runing="ps aux | grep"
alias la="ls -a"
alias -s ="cat"
alias fptz="ssh fptz"
alias kvimclj="ps aux | grep -v grep | grep vimclojure | awk '{print \$2}' | xargs kill"
alias u2d="yaourt -Syua"
alias e="emacs -nw"

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


alias -g L='|less' 
alias -g S='&> /dev/null &'

alias -s {clj,el}="emacs -nw"
alias -s {html,xml}="google-chrome"
alias -s {README,md,txt}="show_file"

