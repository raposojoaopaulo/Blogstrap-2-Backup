#!/bin/bash
 
set -e
 
bundle install
yarn install

rm -rf tmp/pids/server.pid
 
exec "$@"