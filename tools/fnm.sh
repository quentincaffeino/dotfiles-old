#!/usr/bin/sh

set -e

# Absolute path to this script, e.g. /home/user/bin/foo.sh
_SCRIPT_PATH="$(readlink -f $0)"
# Absolute path this script is in, thus /home/user/bin
_PROJECT_PATH="$(dirname ${_SCRIPT_PATH})/.."

function _fnm {
  set -x

  if [ "$(./utils/test_command_exists.sh fnm)" == "true" ]; then
    echo "fnm is already installed"
    exit 0
  fi

  source ./rc.d/000_gc.sh

  cd "$(./utils/get_projects_path.sh)"
  gc https://github.com/Schniz/fnm.git
  "${_PROJECT_PATH}/utils/git_checkout_to_latest_tag.sh"

  export SKIP_SHELL=true
  source ./.ci/install.sh

  local _CONF_FILE="${_PROJECT_PATH}/rc.d/000_fnm.local.sh"
  printf '# fnm\n' > $_CONF_FILE
  printf 'export PATH='"$INSTALL_DIR"':$PATH\n' >> $_CONF_FILE
  printf 'eval "`fnm env`"\n' >> $_CONF_FILE
}

_fnm
