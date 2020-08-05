#!/usr/bin/env bash

set -ex

git submodule update --init --recursive
rm -rf build
mkdir build || exit 1

docker build --tag build_barrier .
docker run --rm -i --mount type=bind,source=${PWD},destination=/code build_barrier
