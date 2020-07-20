#!/bin/bash

version="$1"
silent="$2"

GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
RESET="$(tput sgr0)"

echo -n "$YELLOW"
if [[ -n "$version" ]] ; then
    if [[ -z "$silent" ]] ; then
        echo "Updating the JDK for the current session to $version"
    fi
    export JAVA_HOME="/usr/lib/jvm/java-$version-openjdk/"
    export PATH="${JAVA_HOME}bin:$(echo "$PATH" | perl -pe "s|/usr/lib/jvm/.*?:||")"
else
    if [[ -z "$silent" ]] ; then
        echo "Current JDK for this session"
    fi
fi
echo -n "$RESET"

echo -n "$GREEN"
if [[ -z "$silent" ]] ; then
    echo
    java -version
fi
echo -n "$RESET"
