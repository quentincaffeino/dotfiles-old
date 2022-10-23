#!/usr/bin/sh

set -e

function _rustup {
  set -x

  if [ "$(./utils/test_command_exists.sh rustup)" == "true" ]; then
    echo "rustup is already installed"
    exit 0
  fi

  # Absolute path to this script, e.g. /home/user/bin/foo.sh
  local _SCRIPT_PATH="$(readlink -f $0)"
  # Absolute path this script is in, thus /home/user/bin
  local _PROJECT_PATH="$(dirname ${_SCRIPT_PATH})/.."

  local _RUST_IS_NOT_PRESENT=$(command -v "rust"; test "$$?")
  if test "$_RUST_IS_NOT_PRESENT" != "0"; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    printf "# rust cargo\n. ~/.cargo/env\n" | tee -a "${_PROJECT_PATH}/rc.d/000_cargo.local.sh"
  fi
}

_rustup
