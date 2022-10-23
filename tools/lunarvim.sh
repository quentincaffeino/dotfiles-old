#!/usr/bin/sh

set -e

function _lunarvim {
  set -x

  if [ "$(./utils/test_command_exists.sh lvim)" == "true" ]; then
    echo "lvim is already installed"
    exit 0
  fi

  ./tools/neovim.sh

  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
}

_lunarvim
