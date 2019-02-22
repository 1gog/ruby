#!/bin/bash

echo ${PATH}

eval "$(rbenv init -)"
rbenv global 2.5.0
rbenv rehash
ruby -v

