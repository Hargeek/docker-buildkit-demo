FROM alpine as base

ENV SOME_ENV 1

FROM base as stage1

RUN apk update \
    && apk add --no-cache curl wget

WORKDIR /www
COPY ./resource1 /www/

# complicated computation
# ...

FROM base as stage2

RUN apk update \
    && apk add --no-cache build-base

WORKDIR /www
COPY ./resource2 /www/

# complicated computation
# ...

FROM base as stage3

RUN apk update \
    && apk add --no-cache alpine-sdk

WORKDIR /www
COPY ./resource3 /www/

# complicated computation
# ...

FROM base as stage4

RUN apk update \
    && apk add --no-cache gcc musl-dev

WORKDIR /www
COPY ./resource4 /www/

# complicated computation
# ...

FROM alpine as final

WORKDIR /www
COPY --from=stage1 /www/resource1 .
COPY --from=stage2 /www/resource2 .
COPY --from=stage3 /www/resource3 .
COPY --from=stage4 /www/resource4 .