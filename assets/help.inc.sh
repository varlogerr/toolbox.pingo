__iife() {
  unset __iife

  echo "Usage:"
  while read -r l; do
    [[ -n "${l}" ]] && echo "  ${l}"
  done <<< "
    ${THE_SCRIPT_NAME} [OPTIONS] HOST
  "

  echo
  echo "Available options:"
  while IFS='' read -r l; do
    grep -q '^\s*$' <<< "${l}" && continue
    echo "${l:2}"
  done <<< "
    -h, -?, --help  print this help
    -c, --count     how many packets to send in a set
                    (\`ping -c\` option), defaults to ${OPTS[count]}
    -o, --output    output file, defaults to ${OPTS[output]}
    -i, --interval  interval between sets in seconds,
                    defaults to ${OPTS[interval]}. Set to 0 to not repeat
  "

  local log_file="./${THE_SCRIPT_NAME%.*}.log"
  echo
  echo "Demo:"
  while read -r l; do
    [[ -n "${l}" ]] && echo "  ${l}"
  done <<< "
    ${THE_SCRIPT_NAME} -c ${OPTS[count]} -i ${OPTS[interval]} -o ${log_file} google.com
  "
} && __iife
