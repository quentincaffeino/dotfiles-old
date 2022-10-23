#!/usr/bin/sh

set -e

function _nodejs {
  set -x

  if [ "$(./utils/test_command_exists.sh node)" == "true" ]; then
    echo "node is already installed"
    exit 0
  fi

  ./tools/fnm.sh

  fnm use --install-if-missing lts-latest
}

_nodejs
