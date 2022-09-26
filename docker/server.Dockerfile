# syntax=docker/dockerfile:1

ARG APP_USER=app
ARG WORKDIR=app

FROM alpine:3 as base

ARG APP_USER

RUN apk update --no-cache && apk upgrade --no-cache && adduser -D ${APP_USER}

FROM base as build-deps

ARG APP_USER=app
ARG WORKDIR=app

RUN apk add make go

WORKDIR /home/${APP_USER}/${WORKDIR}

COPY --link --chown=${APP_USER}:${APP_USER} . ${APP_PATH}

FROM build-deps as build-server

RUN pwd && ls -lA server && make server
