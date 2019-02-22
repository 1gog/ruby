#!/bin/bash


VERSION=$1
docker build --build-arg ${VERSION} -f Dockerfile -t test/ruby:latest .

