# syntax = docker/dockerfile:1.4
FROM node:alpine as builder

WORKDIR /www
COPY package.json package-lock.json ./

RUN npm i

FROM node:apline

WORKDIR /www
COPY --from=builder /www/mode_modules ./node_modules

EXPOSE 3000

CMD ["node", "app.js"]