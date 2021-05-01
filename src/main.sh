#!/usr/bin/env bash

set -eux

tmpdir=$(mktemp -d)
tfenv_path=$tmpdir/.tfenv

git clone https://github.com/tfutils/tfenv.git $tfenv_path
