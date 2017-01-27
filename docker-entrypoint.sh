#!/bin/bash
set -e

if [[ "$@" == "run" ]]; then
  /run-playbook.sh
fi

exec "/bin/bash"
