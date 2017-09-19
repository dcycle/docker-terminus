#!/bin/bash

if [ -z "$PANTHEON_TOKEN" ]; then
  echo 'Please specify your Pantheon token as an environment variable, like so:'
  echo ''
  echo 'docker run -e PANTHEON_TOKEN=enter-your-token-here \'
  echo '  dcycle/terminus \'
  echo '  --env=test \'
  echo '  --site=your-site \'
  echo '  drush "uli"'
  exit 1
fi

/terminus-application/vendor/pantheon-systems/terminus/bin/terminus \
  auth login --machine-token="$PANTHEON_TOKEN"

/terminus-application/vendor/pantheon-systems/terminus/bin/terminus \
  $@
