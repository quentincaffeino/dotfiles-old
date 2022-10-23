#!/usr/bin/sh

set -e

function _pnpm {
  set -x

  if [ "$(./utils/test_command_exists.sh pnpm)" == "true" ]; then
    echo "pnpm is already installed"
    exit 0
  fi

  ./tools/nodejs.sh

  curl -fsSL https://get.pnpm.io/install.sh | sh -
}

_pnpm
