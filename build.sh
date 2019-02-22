#!/bin/bash


VERSION=$1
docker build --build-arg ${VERSION} -f Dockerfile -t 1gog/ruby:${VERSION} .

