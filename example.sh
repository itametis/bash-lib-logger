#!/usr/bin/env bash
#####
## COPYRIGHT © ITAMETIS - TOUS DROITS RÉSERVÉS
## Pour plus d'information veuillez contacter : copyright@itametis.com
#####
set -u pipefail

. ./src/lib-logger.sh

LOG_LEVEL="$LOG_LEVEL_TRACE"
#LOG_OUTPUT="/tmp/some/folders/my-file.log"

LOGGER_logTrace "This log is written at TRACE level"
LOGGER_logDebug "This log is written at DEBUG level"
LOGGER_logInfo "This log is written at INFO level"
LOGGER_logWarning "This log is written at WARNING level"
LOGGER_logError "This log is written at ERROR level"