__iife() {
  unset __iife
  local eopt=0

  while :; do
    [[ -z "${1+x}" ]] && break

    case "${1}" in
      --count=?*)     OPTS[count]="${1#*=}" ;;
      -c|--count)     OPTS[count]="${2}"; shift ;;
      --output=?*)    OPTS[output]="${1#*=}" ;;
      -o|--output)    OPTS[output]="${2}"; shift ;;
      --interval=?*)  OPTS[interval]="${1#*=}" ;;
      -i|--interval)  OPTS[interval]="${2}"; shift ;;
      -\?|-h|--help)  OPTS[help]=1 ;;
      *)              OPTS[host]="${1}" ;;
    esac
    shift
  done
} && __iife "${@}"
