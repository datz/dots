extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1 ;;
	*.tar.gz) tar xvzf $1 ;;
	*.bz2) bunzip2 $1 ;;
	*.rar) rar x $1 ;;
	*.gz) gunzip $1 ;;
	*.tar) tar xvf $1 ;;
	*.tbz2) tar xvjf $1 ;;
	*.tgz) tar xvzf $1 ;;
	*.zip) unzip $1 ;;
	*.Z) uncompress $1 ;;
	*.7z) 7z x $1 ;;
	*) echo "don't know how to extract '$1′…" ;;
	esac
	else
		echo "'$1′ is not a valid file!"
			fi
}

insert_sudo () {
	[[ -z $BUFFER ]] && zle up-history
	if [[ $BUFFER != sudo\ * ]]; then
		zle beginning-of-line
		zle -U "sudo "
	fi
}


function show_file {
	if [ -f $1 ]; then
		if [ $LINES -gt `wc -l $1 | awk '{print $1}'` ]; then
			cat $1
		else
			less $1
		fi
	fi
}

