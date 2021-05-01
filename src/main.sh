#!/usr/bin/env bash

set -eux

tmpdir=$(mktemp -d)
tfenv_path=$tmpdir/.tfenv

if [[ ! -e $tfenv_path ]]; then
  git clone https://github.com/tfutils/tfenv.git $tfenv_path
fi

echo "Goodbye"
