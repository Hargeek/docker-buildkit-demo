# syntax = docker/dockerfile:experimental
FROM node:alpine

WORKDIR /www

ENV REGISTRY https://registry.npmmirror.com
ENV TEST 1

RUN --mount=type=cache,target=/root/.npm \
    npm install -dd --registry=$REGISTRY express mysql elasticsearch axios jquery webpack http-server next rxjs