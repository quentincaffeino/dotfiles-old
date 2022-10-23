#!/usr/bin/sh

set -e

function _git_checkout_to_latest_tag {
  local _LATEST_TAG="$(git describe --abbrev=0 --tags)"
  git fetch origin
  git checkout "$_LATEST_TAG"
}

_git_checkout_to_latest_tag
