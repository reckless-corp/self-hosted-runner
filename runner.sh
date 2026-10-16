#!/bin/sh -ex

docker build -f Dockerfile -t reckless-runner .

group=$(cat /etc/group | grep ^docker | cut -d: -f3)

docker run --rm -it -d \
	--name gh-runner \
	-u $(id -u) \
	--group-add ${group} \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v /var/code/reckless-corp:/var/code/reckless-corp \
	-v /var/gh-runner:/var/gh-runner \
	-w /var/gh-runner \
	reckless-runner ./run.sh
