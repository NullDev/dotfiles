alias ll='ls -alF'
alias targz='tar -zxvf'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias timer='echo -e " \n################################\n#---     Timer started      ---#\n# (Stop with CTRL+D or CTRL+C) #\n################################\n" && date && time cat && date'
alias week='date +%V'
alias gip='curl icanhazip.com'
alias clearhistory='cat /dev/null > ~/.bash_history && history -c && exit' 
alias lnn='lnn'
alias cls='cls'

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
