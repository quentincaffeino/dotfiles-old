#!/usr/bin/sh

set -e

# Absolute path to this script, e.g. /home/user/bin/foo.sh
_SCRIPT_PATH="$(readlink -f $0)"
# Absolute path this script is in, thus /home/user/bin
_PROJECT_PATH="$(dirname ${_SCRIPT_PATH})/.."

function _fetch_latest_version_code {
  source "${_PROJECT_PATH}/rc.d/000_gc.sh"
  cd "$(${_PROJECT_PATH}/utils/get_projects_path.sh)"
  gc https://github.com/LinusDierheimer/fastfetch.git
  "${_PROJECT_PATH}/utils/git_checkout_to_latest_tag.sh"
}

function _build_source {
  mkdir -p build
  cd build
  sudo dnf install -y rpm-devel pciutils-devel
  cmake ..
  cmake --build . --target fastfetch -j$(nproc)
}

function _install {
  if [ "$(${_PROJECT_PATH}/utils/test_command_exists.sh fastfetch)" == "true" ]; then
    echo "fastfetch is already installed"
    exit 0
  fi

  _fetch_latest_version_code

  _build_source

  sudo install fastfetch "$HOME/.local/bin"
  printf "# Runs fastfetch on terminal startup\nfastfetch\n" | tee "${_PROJECT_PATH}/rc.d/000_fastfetch.local.sh"
}

function _fastfetch {
  set -x

  case $1 in
  "i" | "install")
    _install
    ;;

  *)
    # STATEMENTS
    ;;
esac
}

_fastfetch "$@"
