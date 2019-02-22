#!/bin/bash


RUBY_VERSION="$1"
docker build --build-arg RUBY_VERSION=${RUBY_VERSION} -f Dockerfile -t 1gog/ruby:${RUBY_VERSION} .

