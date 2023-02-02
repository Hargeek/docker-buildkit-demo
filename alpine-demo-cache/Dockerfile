# syntax = docker/dockerfile:experimental
FROM alpine
ENV TEST 1
RUN ln -s /var/cache/apk /etc/apk/cache
RUN --mount=type=cache,target=/var/cache/apk --mount=type=cache,target=/etc/apk/cache \
    apk update \
    && apk add build-base alpine-sdk python3-dev