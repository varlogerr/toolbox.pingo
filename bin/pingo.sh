#!/usr/bin/env bash

THE_SCRIPT="${BASH_SOURCE[0]}"
THE_SCRIPT_NAME="$(basename "${THE_SCRIPT}")"
TOOL_DIR="$(realpath "$(dirname "$(realpath "${THE_SCRIPT}")")/..")"

declare -A OPTS=(
  [count]=10
  [output]=/dev/stdout
  [interval]=600
  [help]=0
  [host]=''
  [inval]=''
)

. "${TOOL_DIR}/assets/func.sh"
. "${TOOL_DIR}/assets/opts.inc.sh"

[[ ${OPTS[help]} -eq 1 ]] && {
  . "${TOOL_DIR}/assets/help.inc.sh"
  exit
}

if [[ -z "${OPTS[host]}" ]]; then
  echo "Error:"
  echo "  host is required!"
  echo
  . "${TOOL_DIR}/assets/help.inc.sh"

  exit 1
fi

ctr=0; while :; do
  if [[ ${ctr} -gt 0 ]]; then
    echo
    echo '=========='
  fi
  (( ctr++ ))

  printf -- '[%s] Host: %s, Interval: %s, Count: %s\n' \
    "$(get_ts)" "${OPTS[host]}" "${OPTS[interval]}" \
    "${OPTS[count]}"

  ping -c "${OPTS[count]}" "${OPTS[host]}"

  [[ ${OPTS[interval]} -lt 1 ]] && break

  sleep "${OPTS[interval]}"
done >> "${OPTS[output]}"
