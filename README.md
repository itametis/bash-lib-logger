# Bash lib logger

This library is a single Bash file helping you to write logs with color in yours scripts.


## Usage
To load and use this lib, just respect the following order.

##### 1) Define the LOG_LEVEL variable to the existing log levels.
 The existing log levels are :
 - $LOG_LEVEL_TRACE
 - $LOG_LEVEL_DEBUG
 - $LOG_LEVEL_INFOS
 - $LOG_LEVEL_WARNING
 - $LOG_LEVEL_ERROR

For instance : `export LOG_LEVEL="$LOG_LEVEL_DEBUG"`


##### 2) Define a LOG_OUTPUT variable

For instance : `export LOG_OUTPUT="/var/log/my-file.log"`

or `export LOG_OUTPUT=""` to redirect all logs in the current output (generally the console).


##### 3) Source this file then use it.

For instance :
```bash
. ./lib-logger.sh
LOGGER_logTrace "This log is written as TRACE level"
LOGGER_logDebug "This log is written as DEBUG level"
LOGGER_logInfo "This log is written as INFO level"
LOGGER_logWarning "This log is written as WARNING level"
LOGGER_logError "This log is written as ERROR level"
```
