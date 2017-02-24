#!/bin/bash
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME=$(tput setaf 190)
POWDERBLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)
printf "\n\n"
printf "${BLACK}Black\n${RED}Red\n${GREEN}Green\n${YELLOW}Yellow\n${LIME}Lime\n"
printf "${POWDERBLUE}Powder Blue\n${BLUE}Blue\n${MAGENTA}Magenta\n${CYAN}Cyan\n"
printf "${WHITE}White\n\n"
exit 0
