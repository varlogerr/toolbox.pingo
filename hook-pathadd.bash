[[ -n "${BASH_VERSION}" ]] && {
  __iife() {
    unset __iife
    local projdir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

    [[ "$(type -t pathadd.append)" != 'function' ]] && return

    PINGO_BINDIR="${PINGO_BINDIR:-${projdir}/bin}"
    [[ -z "$(bash -c 'echo ${PINGO_BINDIR+x}')" ]] \
      && export PINGO_BINDIR

    pathadd.append "${PINGO_BINDIR}"
  } && __iife
}
