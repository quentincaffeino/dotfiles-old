#!/usr/bin/sh

set -e

function _neovim {
  set -x

  if [ "$(./utils/test_command_exists.sh nvim)" == "true" ]; then
    echo "nvim is already installed"
    exit 0
  fi

  sudo dnf install neovim
}

_neovim
