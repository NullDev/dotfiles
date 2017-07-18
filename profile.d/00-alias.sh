alias ll='ls -alF'
alias ext='ext'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias timer='echo -e " \n################################\n#---     Timer started      ---#\n# (Stop with CTRL+D or CTRL+C) #\n################################\n" && date && time cat && date'
alias week='date +%V'
alias gip='curl icanhazip.com'
alias clearhistory='cat /dev/null > ~/.bash_history && history -c && exit' 
alias lnn='lnn'
alias cls='cls'
alias chp='chp'
alias epoch='epoch'

IsOpen=null
function lnn {
        sed -n "$1p" < $2
}

function cls {
        XA=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
        YA=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
        printf "\033c" 
        printf "\e[8;${XA};${YA}t" 
        printf "\e[5t" 
}

function chp {
        nc -z $1 $2; IsOpen=$?
        if [ "$IsOpen" == "0" ]; then
                echo "Port is in use"
        else
                echo "Port is not in use"
        fi
}

function ext {
        if [ -f "$1" ] ; then
                case "$1" in
                        *.tar.bz2)   tar xvjf  "$1"    ;;
                        *.tar.gz)    tar xvzf "$1"     ;;
                        *.bz2)       bunzip2  "$1"     ;;
                        *.rar)       unrar x  "$1"     ;;
                        *.gz)        gunzip  "$1"      ;;
                        *.tar)       tar xvf  "$1"     ;;
                        *.tbz2)      tar xvjf  "$1"    ;;
                        *.tgz)       tar xvzf  "$1"    ;;
                        *.zip)       unzip  "$1"       ;;
                        *.Z)         uncompress  "$1"  ;;
                        *.7z)        7z x  "$1"        ;;
                        *)           echo "'$1' has an unknow format" ;;
                esac
        else
                echo "'$1' is not a valid file."
        fi
}

function epoch {
        TESTREG="[\d{10}]"
        if [[ "$1" =~ $TESTREG ]]; then
                date -d @$*
        else
                if [ $# -gt 0 ]; then
                        date +%s --date="$*"
                else
                        date +%s
                fi
        fi
}
