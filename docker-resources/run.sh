#!/bin/bash

if [ -z "$PANTHEON_TOKEN" ]; then
  >&2 echo 'Please specify your Pantheon token as an environment variable.'
  >&2 echo ''
  >&2 echo 'see README at https://github.com/dcycle/docker-terminus for details.'
  exit 1
fi

if [ -z "$SSHKEYNOPASS" ]; then
  >&2 echo 'Please specify your password-less SSH key as an environment variable.'
  >&2 echo ''
  >&2 echo 'see README at https://github.com/dcycle/docker-terminus for details.'
  exit 1
fi

KEYLOC="/root/.ssh/$SSHKEYNOPASS"

if [ ! -f "$KEYLOC" ]; then
  >&2 echo "$KEYLOC must exist."
  >&2 echo ''
  >&2 echo 'see README at https://github.com/dcycle/docker-terminus for details.'
  exit 1
fi

/terminus-application/vendor/pantheon-systems/terminus/bin/terminus \
  auth:login --machine-token="$PANTHEON_TOKEN"

ssh-agent bash -c \
  "ssh-add $KEYLOC; /terminus-application/vendor/pantheon-systems/terminus/bin/terminus $@"
