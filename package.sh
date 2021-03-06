#
# Terminal Logging.
#

declare -i \
  LOG_LEVEL_FATAL=0 \
  LOG_LEVEL_ERROR=10 \
  LOG_LEVEL_WARN=100 \
  LOG_LEVEL_INFO=1000 \
  LOG_LEVEL_DEBUG=10000 \
  LOG_LEVEL_TRACE=100000

declare -i LOG_LEVEL=${LOG_LEVEL:-$LOG_LEVEL_ERROR}

log-is-info-enabled() {
  [ $LOG_LEVEL -ge $LOG_LEVEL_INFO ]
}

log-info() {
  log-is-info-enabled && echo -e "[${COL_MAGENTA}INFO${COL_CLEAR}] $*"
}

log-set-info() {
  LOG_LEVEL=$LOG_LEVEL_INFO
}

log-is-debug-enabled() {
  [ $LOG_LEVEL -ge $LOG_LEVEL_DEBUG ]
}

log-debug() {
  log-is-debug-enabled && echo -e "[${COL_BLUE}INFO${COL_CLEAR}] $*"
}

log-set-debug() {
  LOG_LEVEL=$LOG_LEVEL_DEBUG
}

log-is-warn-enabled() {
  [ $LOG_LEVEL -ge $LOG_LEVEL_WARN ]
}

log-warn() {
  log-is-warn-enabled && echo -e "[${COL_YELLOW}WARN${COL_CLEAR}] $*" >&2
}

log-set-warn() {
  LOG_LEVEL=$LOG_LEVEL_WARN
}

log-is-error-enabled() {
  [ $LOG_LEVEL -ge $LOG_LEVEL_ERROR ]
}

log-error() {
  log-is-error-enabled && echo -e "[${COL_RED}ERROR${COL_CLEAR}] $*" >&2
}

log-set-error() {
  LOG_LEVEL=$LOG_LEVEL_ERROR
}

log-fatal() {
  echo -e "${COL_RED}[FATAL] $* ${COL_CLEAR}" >&2
}

log-set-fatal() {
  LOG_LEVEL=$LOG_LEVEL_FATAL
}

emphasize() {
  echo -e "${COL_MAGENTA}$*${COL_CLEAR}"
}

success() {
  echo -e "[${COL_GREEN}DONE${COL_CLEAR}] $*"
}

fail() {
  echo -e "[${COL_RED}FAIL${COL_CLEAR}] $*" >&2
}
