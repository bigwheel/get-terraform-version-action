#!/usr/bin/env bash

set -eu

target_path=$1

tmpdir=$(mktemp -d)
tfenv_path=$tmpdir/.tfenv

# https://github.com/tfutils/tfenv#manual
git clone https://github.com/tfutils/tfenv.git $tfenv_path 2> /dev/null
PATH="$tfenv_path/bin:$PATH"

# by https://github.com/tfutils/tfenv/blob/43e0aad9/libexec/tfenv-install#L66-L75
cd $target_path
resolved="$(tfenv resolve-version)"
regex="${resolved##*\:}"
version="$(tfenv list-remote | grep -e "${regex}" | head -n 1)"

echo $version
