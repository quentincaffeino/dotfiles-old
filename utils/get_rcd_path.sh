#!/usr/bin/sh

set -e

function _get_rcd_path {
  local _PATH="$HOME/.$(./utils/get_shell_name.sh)rc.d"

  if [ ! -e $_PATH ]; then
    mkdir -p $_PATH
  fi

  echo $_PATH
}

_get_rcd_path
