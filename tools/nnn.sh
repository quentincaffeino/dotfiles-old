#!/usr/bin/sh

set -e

function _nnn {
  set -x

  if [ "$(./utils/test_command_exists.sh nnn)" == "true" ]; then
    echo "nnn is already installed"
    exit 0
  fi

  sudo dnf install -y nnn
}

_nnn
