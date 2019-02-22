#!/bin/bash

echo ${PATH}

eval "$(rbenv init -)"
rbenv global ${RUBY_VERSION} 
rbenv local ${RUBY_VERSION}
rbenv rehash
ruby -v
gem install pg 
gem install elasticsearch 
gem install mongodb

