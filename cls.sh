function cls {
    XA=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
    YA=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
    printf "\033c" 
    printf "\e[8;${XA};${YA}t" 
    printf "\e[5t" 
}
