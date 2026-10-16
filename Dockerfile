FROM ubuntu:26.04

RUN apt update && apt install -y curl git docker.io wget
RUN apt install -y liblttng-ust-common1t64 liblttng-ust-ctl6 liblttng-ust1t64 libnuma1 libicu78
RUN apt install -y ostree
