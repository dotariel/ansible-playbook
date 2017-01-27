#!/bin/bash

cmd="ansible-playbook -i local, -c local "/project/${PLAYBOOK}" --extra-vars="${EXTRA_VARS}" $VERBOSITY"

if [ -f /vault/password ]; then
  cmd="$cmd --vault-password-file /vault/password"
fi

$cmd
