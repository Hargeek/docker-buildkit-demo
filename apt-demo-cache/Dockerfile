# syntax = docker/dockerfile:experimental
FROM ubuntu
ENV TEST 1
RUN rm -rf /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt update -yq \
  && apt-get --no-install-recommends install -yq gcc build-essential