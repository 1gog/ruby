#!/bin/bash


VERSION=$!
docker build --build-arg=${VERSION} -f Dockerfile -t test/ruby:latest .

