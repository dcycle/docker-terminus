set -e
docker pull php:7
docker build -t local-dcycle-terminus-image .
