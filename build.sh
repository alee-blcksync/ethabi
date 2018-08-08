#!/bin/bash -x

curr_dir=$(cd $(dirname $0); pwd)

DEBUG=${DEBUG:-"false"}
build_cmd="docker build "

if [ "$DEBUG" != "true" ] ; then
  build_cmd="docker build --no-cache"
fi

# Build base dev image with the correct non-pivileged UID user
$build_cmd \
  --rm \
  -t ethabi-cli \
  --build-arg ETHABI_UID=$(id -u $USER) \
  --file Dockerfile \
  .
