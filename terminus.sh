docker kill terminus-container > /dev/null 2> /dev/null || true
docker rm terminus-container > /dev/null 2> /dev/null || true
docker run --name terminus-container terminus-image /terminus-application/vendor/pantheon-systems/terminus/bin/terminus "$@"
docker commit terminus-container terminus-image
