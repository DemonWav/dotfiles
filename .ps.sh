#!/bin/bash

SUCCESS="$1"  ; USERNAME="$2"
HOSTNAME="$3" ; DIR="$4"

DIR=$(pwd)
[[ "$DIR" =~ ^"$HOME"(/|$) ]] && DIR="~${DIR#$HOME}"

RED="$(tput setaf 1)"  ; GREEN="$(tput setaf 2)"  ; BLUE="$(tput setaf 4)"
CYAN="$(tput setaf 6)" ; YELLOW="$(tput setaf 3)" ; WHITE="$(tput setaf 7)"
DIM="$(tput dim)"      ; RESET="$(tput sgr0)"

IS_GIT="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

[[ "$IS_GIT" == "true" ]] && GIT="┤$YELLOW$(git branch | sed -n '/\* /s///p' |\
sed 's/(\|)//g' | sed "s/detached at/${DIM}detached at$RESET$YELLOW/" |\
sed "s/detached from/${DIM}detached from$RESET$YELLOW/")$RESET├─"

[[ "$USERNAME" == "root" ]] && WHOAMI="$RED" || WHOAMI="$BLUE"
WHOAMI="$WHOAMI$2$RESET"
[[ "$SUCCESS" == 0 ]] && STATUS="$GREEN✓" || STATUS="$RED✗"
STATUS="$STATUS$RESET"

# shorten long directory names
IFS='/' read -r -a array <<< "$DIR"
for element in "${array[@]}" ; do
    if [[ "$element" == "~" ]] ; then
        FINAL_DIR="~/"
    elif [[ "$(echo $element | wc -c)" -gt "25" ]] ; then
        FINAL_DIR="$FINAL_DIR${element::25}.../"
    else
        FINAL_DIR="$FINAL_DIR$element/"
    fi
done
# cosmetic reasons, make sure there's never a space before a '...'
FINAL_DIR="$(echo $FINAL_DIR | sed 's/ \.\.\./\.\.\./g')"
[[ "$FINAL_DIR" != "/" ]] && FINAL_DIR="${FINAL_DIR::-1}"

echo -e "\n┌─┤$STATUS├─┤$WHOAMI├─$GIT\
┤$GREEN$FINAL_DIR$RESET│\n└──▶ "

unset SUCCESS ; unset USERNAME ; unset HOSTNAME ; unset DIR    ; unset RED
unset GREEN   ; unset BLUE     ; unset CYAN     ; unset YELLOW ; unset WHITE
unset DIM     ; unset RESET    ; unset IS_GIT   ; unset GIT    ; unset WHOAMI
unset STATUS
