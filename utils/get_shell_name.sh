#!/usr/bin/sh

set -e

function _get_shell_name {
  echo "$(basename $SHELL)"
}

_get_shell_name
