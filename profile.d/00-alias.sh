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

function lnn() { sed -n "$1p" < $2 }
