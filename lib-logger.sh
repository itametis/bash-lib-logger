#!/usr/bin/env bash
#####
## COPYRIGHT © ITAMETIS - TOUS DROITS RÉSERVÉS
## Pour plus d'information veuillez contacter : copyright@itametis.com
#####

set -u pipefail

#####
## USAGE
##
## To load and use this lib, just respect the following order.
##
##
## 1) Define the LOG_LEVEL variable to the existing log levels.
##
##  The existing log levels are :
##  - $LOG_LEVEL_TRACE
##  - $LOG_LEVEL_DEBUG
##  - $LOG_LEVEL_INFOS
##  - $LOG_LEVEL_WARNING
##  - $LOG_LEVEL_ERROR
##
##  For instance : export LOG_LEVEL="$LOG_LEVEL_DEBUG"
##
##
## 2) Define a LOG_OUTPUT variable (only if you want to redirect log in a file).
##
##  For instance : export LOG_OUTPUT="/var/log/my-file.log"
##
##
## 3) Source this file then use it.
##
##  For instance :
##  . ./lib-logger.sh
##  LOGGER_logTrace "This log is written as TRACE level"
##  LOGGER_logDebug "This log is written as DEBUG level"
##  LOGGER_logInfo "This log is written as INFO level"
##  LOGGER_logWarning "This log is written as WARNING level"
##  LOGGER_logError "This log is written as ERROR level"
#####


# The available log levels.
readonly LOG_LEVEL_TRACE=1
readonly LOG_LEVEL_DEBUG=2
readonly LOG_LEVEL_INFOS=3
readonly LOG_LEVEL_WARNING=4
readonly LOG_LEVEL_ERROR=5

readonly _LOGGER_BLACK="0"
readonly _LOGGER_RED="1"
readonly _LOGGER_GREEN="2"
readonly _LOGGER_YELLOW="3"
readonly _LOGGER_BLUE="4"
readonly _LOGGER_MAGENTA="5"
readonly _LOGGER_CYAN="6"
readonly _LOGGER_WHITE="7"
readonly _LOGGER_CANCEL_COLOR=`tput setaf "${_LOGGER_WHITE}"`




_LOGGER_echo_color() {
    local LOG_LEVEL="$1"
    local TEXT="$2"


    local chosenColor=""


    case "$LOG_LEVEL" in
        $LOG_LEVEL_TRACE)
            chosenColor=`tput setaf "${_LOGGER_WHITE}"`
            ;;
        $LOG_LEVEL_DEBUG)
            chosenColor=`tput setaf "${_LOGGER_BLUE}"`
            ;;
        $LOG_LEVEL_INFOS)
            chosenColor=`tput setaf "${_LOGGER_CYAN}"`
            ;;
        $LOG_LEVEL_WARNING)
            chosenColor=`tput setaf "${_LOGGER_YELLOW}"`
            ;;
        $LOG_LEVEL_ERROR)
            chosenColor=`tput setaf "${_LOGGER_RED}"`
            ;;
        *)
            chosenColor="NC"
            ;;
    esac

    local result

    if [ "$LOG_OUTPUT" != "" ] || [ "$chosenColor" == "NC" ]; then
        result="$TEXT"
    else
        result="${chosenColor}$TEXT${_LOGGER_CANCEL_COLOR}"
    fi

    echo "$result"
}


########################################################################################################################


###
# Prints the specified message into the console.
# $1 - The message to print.
LOGGER_log() {
    if [ "$LOG_OUTPUT" != "" ] && [ ! -f "$LOG_OUTPUT" ]; then
        mkdir -p "$LOG_OUTPUT"
        rmdir "$LOG_OUTPUT"
        touch "$LOG_OUTPUT"
    fi
    
    if [ "$LOG_OUTPUT" != "" ]; then
        echo "$1" >> "$LOG_OUTPUT"
    else
        echo "$1"
    fi
}


###
# Prints the specified message as 'DEBUG' level.
# $1 - The message to print into the console.
LOGGER_logDebug() {
    _LOGGER_logMessage $LOG_LEVEL_DEBUG " DEBUG " "$1"
}


###
# Prints the specified message as 'ERROR' level.
# $1 - The message to print into the console.
LOGGER_logError() {
    _LOGGER_logMessage $LOG_LEVEL_ERROR " ERROR " "$1"
}


###
# Prints the specified message as 'INFOS' level.
# $1 - The message to print into the console.
LOGGER_logInfo() {
    _LOGGER_logMessage  $LOG_LEVEL_INFOS " INFOS " "$1"
}


###
# Prints the specified message as 'ERROR' level.
# $1 - The message to print into the console.
LOGGER_logTrace() {
    _LOGGER_logMessage $LOG_LEVEL_TRACE " TRACE " "$1"
}


###
# Prints the specified message as 'WARNING' level.
# $1 - The message to print into the console.
LOGGER_logWarning() {
    _LOGGER_logMessage $LOG_LEVEL_WARNING "WARNING" "$1"
}


########################################################################################################################

###
# Formats the specified parameters then passes them to the log() function.
# $1 - The log level of the message
# $2 - The level message
# $3 - The message to print
_LOGGER_logMessage() {
    local echo_color

    if [ $1 -ge $LOG_LEVEL ]; then
        echo_color=`_LOGGER_echo_color "$1" "[$2] $3"`
        LOGGER_log "$echo_color"
    fi
}


[[ -v LOG_OUTPUT ]]; LOG_OUTPUT=""

[[ -v LOG_LEVEL ]]; LOG_LEVEL="$LOG_LEVEL_INFOS" && LOGGER_logWarning "[WARNING] LOG_LEVEL not defined. LOG_LEVEL has been defaulted to 'INFO'"


LOGGER_logDebug "ITAMETIS Bash API logger initialized"
