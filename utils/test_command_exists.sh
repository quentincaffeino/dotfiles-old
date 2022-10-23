#!/usr/bin/sh

set -e

function _test_command_exists {
  command -v $1 2&> /dev/null
  test $? == 0 && echo 'true' || echo 'false'
}

_test_command_exists "$@"
