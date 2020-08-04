#!/usr/bin/env bash

set -ex

docker build --tag build_barrier .
docker run --rm -i --mount type=bind,source=${PWD},destination=/code build_barrier
