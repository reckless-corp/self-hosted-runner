#!/bin/sh -ex

docker build -f Dockerfile -t reckless-runner .

docker run --rm -it \
	-u $(id -u) \
	--group-add $(getent group docker | cut -d: -f3) \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /var/code/reckless-corp:/var/code/reckless-corp \
	-w /var/code/reckless-corp/self-hosted-runner/data \
	reckless-runner ./run.sh
