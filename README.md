[![CircleCI](https://circleci.com/gh/dcycle/docker-terminus.svg?style=svg)](https://circleci.com/gh/dcycle/docker-terminus)

Run drush on Pantheon sites with [terminus](https://pantheon.io/docs/terminus).

Requirements
-----

### Machine token

Get a "Machine token" from Pantheon as per [the documentation](https://pantheon.io/docs/terminus/install), it will look something like `abc123abc123abc123abc123abc123abc123abc123`.

### SSH key

Make sure at least one of your public-private ssh key pairs used on Pantheon does not have a password.

Example
-----

    TOKEN=abc123abc123abc123abc123abc123abc123abc123
    SSHKEYNOPASS=id_rsa
    docker run --rm \
      -v "$HOME"/.ssh:/root/.ssh \
      -e PANTHEON_TOKEN="$TOKEN" \
      -e SSHKEYNOPASS=id_rsa \
      dcycle/terminus:2 site:list

    MYSITE=my-website
    docker run --rm \
      -v "$HOME"/.ssh:/root/.ssh \
      -e PANTHEON_TOKEN="$TOKEN" \
      -e SSHKEYNOPASS=id_rsa \
      dcycle/terminus:2 "drush $MYSITE.dev pml"

Resources
-----

* [This image on Docker.io](https://hub.docker.com/r/dcycle/terminus/)
