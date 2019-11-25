#!/usr/bin/env bash
#####
# COPYRIGHT © ITAMETIS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#####

set -u pipefail

. ./src/lib-logger.sh

LOG_LEVEL="${LOG_LEVEL_TRACE}"

LOG_OUTPUT=""
#LOG_OUTPUT="/tmp/some/folders/my-file.log"

LOGGER_logTrace "This log is written at TRACE level"
LOGGER_logDebug "This log is written at DEBUG level"
LOGGER_logInfo "This log is written at INFO level"
LOGGER_logWarning "This log is written at WARNING level"
LOGGER_logError "This log is written at ERROR level"