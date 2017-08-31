#!/bin/bash

# SCRIPT NAME
scr="app.js"

# PATHS
declare -a arr=(
	"directory1"
	"directory2"
)

# OTHER ABSOLUT PATHS, FORMAT: "NAME COMMAND/PATH" OR BLANK FOR NONE
declare -a abs=(
	"ExampleScript1 -c python /path/to/script.py"
	"ExampleScript2 /path/to/script.js"
)

# MAIN

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
LIME=$(tput setaf 190)
LBLUE=$(tput setaf 153)
WHITE=$(tput setaf 7)
NORMAL=$(tput sgr0)

function main {
	printf "\n\n\n    ${LBLUE}#######################\n"
	printf "    ${LBLUE}#${WHITE}---------------------${LBLUE}#\n"
	printf "    ${LBLUE}# ${LIME}Starting scripts... ${LBLUE}#\n"
	printf "    ${LBLUE}#${WHITE}---------------------${LBLUE}#\n"
	printf "    ${LBLUE}#######################${NORMAL}\n\n\n"

	printf "${LBLUE}------------------------${NORMAL}\n"

	for i in "${arr[@]}"
	do
		tmp_path="./${i}/${scr}"
		printf "${LIME}Starting ${RED}${i} ${LIME}at path ${LBLUE}$(pwd)/${i}/${scr}${NORMAL}\n"
		printf "${LIME}+ + + + + + + + + + + +${NORMAL}\n"
		printf "$(forever start -a --minUptime 1000 --spinSleepTime 1000 --uid ${i} ${tmp_path})"
		printf "\n${LIME}+ + + + + + + + + + + +${NORMAL}\n"
		printf "${GREEN}Started!${NORMAL}\n"
		printf "${LBLUE}-----------------------${NORMAL}\n"
	done

	printf "\n${LBLUE}------- Externsls -------${NORMAL}\n\n"

	if [ ! -z "$abs" ]; then
		for i in "${abs[@]}"
        	do
                	printf "${LIME}Starting external script ${RED}${i}\n"
                	printf "${LIME}+ + + + + + + + + + + +${NORMAL}\n"
                	printf "$(forever start -a --minUptime 1000 --spinSleepTime 1000 --uid ${i})"
                	printf "\n${LIME}+ + + + + + + + + + + +${NORMAL}\n"
                	printf "${GREEN}Started!${NORMAL}\n"
                	printf "${LBLUE}------------------------${NORMAL}\n"
        	done
	fi

	printf "\n\n    ${LBLUE}#######################\n"
	printf "    ${LBLUE}#${WHITE}---------------------${LBLUE}#\n"
	printf "    ${LBLUE}# ${LIME}Everything started! ${LBLUE}#\n"
	printf "    ${LBLUE}# ${LIME}Check details below ${LBLUE}#\n"
	printf "    ${LBLUE}#${WHITE}---------------------${LBLUE}#\n"
	printf "    ${LBLUE}#######################${NORMAL}\n\n\n"

	printf "${LIME}+ + + + + + + + + + + +${NORMAL}\n"
	printf "$(forever list)"
	printf "\n${LIME}+ + + + + + + + + + + +${NORMAL}\n"
	printf "\n\n\n"

	exit 0
}

function init {
	if [ "${*}" = "--stop" ] || [ "${*}" = "-s" ]; then
		printf "\n\n\n    ${LBLUE}######################\n"
		printf "    ${LBLUE}#${WHITE}--------------------${LBLUE}#\n"
		printf "    ${LBLUE}# ${LIME}Stoping scripts... ${LBLUE}#\n"
		printf "    ${LBLUE}#${WHITE}--------------------${LBLUE}#\n"
		printf "    ${LBLUE}######################${NORMAL}\n\n\n"

		printf "${LBLUE}------------------------${NORMAL}\n"

		printf "${LIME}+ + + + + + + + + + + +${NORMAL}\n"
		printf "$(forever stopall)"
		printf "\n${LIME}+ + + + + + + + + + + +${NORMAL}\n"
		exit 0
	else
		main
	fi

	if [ "${*}" = "--restart" ] || [ "${*}" = "-r" ]; then
		printf "\n\n\n    ${LBLUE}######################\n"
		printf "    ${LBLUE}#${WHITE}--------------------${LBLUE}#\n"
		printf "    ${LBLUE}# ${LIME}Stoping scripts... ${LBLUE}#\n"
		printf "    ${LBLUE}#${WHITE}--------------------${LBLUE}#\n"
		printf "    ${LBLUE}######################${NORMAL}\n\n\n"

		printf "${LBLUE}-----------------------${NORMAL}\n"

		printf "${LIME}+ + + + + + + + + + + +${NORMAL}\n"
		printf "$(forever stopall)"
		printf "\n${LIME}+ + + + + + + + + + + +${NORMAL}\n"
		main
	else
		main
	fi
}

init

exit 0
