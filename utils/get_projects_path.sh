#!/usr/bin/sh

set -e

function _get_projects_path {
  local _PATH="$HOME/projects"

  if [ ! -e $_PATH ]; then
    mkdir -p $_PATH
  fi

  echo $_PATH
}

_get_projects_path
