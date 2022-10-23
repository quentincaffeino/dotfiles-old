#!/usr/bin/sh

set -e

# Absolute path to this script, e.g. /home/user/bin/foo.sh
_SCRIPT_PATH="$(readlink -f $0)"
# Absolute path this script is in, thus /home/user/bin
_PROJECT_PATH="$(dirname ${_SCRIPT_PATH})/.."

function _fzf {
  set -x

  if [ "$(${_PROJECT_PATH}/utils/test_command_exists.sh fzf)" == "true" ]; then
    echo "fzf is already installed"
    exit 0
  fi

  source "${_PROJECT_PATH}/rc.d/000_gc.sh"

  cd "$(${_PROJECT_PATH}/utils/get_projects_path.sh)"
  gc https://github.com/junegunn/fzf.git
  "${_PROJECT_PATH}/utils/git_checkout_to_latest_tag.sh"
  "./install"
}

_fzf "$@"
