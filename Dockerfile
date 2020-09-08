FROM ruby:2.7.1-alpine

RUN apk add --update --no-cache --virtual=builders \
      alpine-sdk build-base linux-headers ruby-dev zlib-dev postgresql-dev
RUN apk add --update --no-cache \
      libc6-compat libc-dev zlib ruby-json tzdata yaml less curl postgresql
RUN mkdir -p /app/server

WORKDIR /app/server

ARG BUNDLE_OPTIONS

ADD Gemfile /app/server/Gemfile
ADD Gemfile.lock /app/server/Gemfile.lock

RUN apk add --no-cache --virtual .rails-builddeps alpine-sdk && \
  bundle install -j4 ${BUNDLE_OPTIONS} && \
  apk del .rails-builddeps

ADD . /app/server
