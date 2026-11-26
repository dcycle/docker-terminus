set -e
docker pull php:8.3
docker build -t local-dcycle-terminus-image .
