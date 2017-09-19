set -e

if [ "$#" -ne 1 ]; then
  echo -e 'Usage:'
  echo -e ''
  echo -e './dcycle/setup-terminus.sh token'
  echo -e ''
  echo -e 'Example:'
  echo -e ''
  echo -e './dcycle/setup-terminus.sh d1566e9b0b34'
  exit 1
fi

TOKEN="$1"

echo -e "About to destroy old containers if necessary."

docker kill terminus-container > /dev/null 2> /dev/null || true
docker rm terminus-container > /dev/null 2> /dev/null || true

docker build -t terminus-image .
docker run --name terminus-container terminus-image \
  /terminus-application/vendor/pantheon-systems/terminus/bin/terminus \
  auth login --machine-token="$TOKEN"
docker commit terminus-container terminus-image
