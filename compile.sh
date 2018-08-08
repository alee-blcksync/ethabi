#!/bin/bash -x

curr_dir=$(cd $(dirname $0); pwd)

DEBUG=${DEBUG:-"true"}
build_cmd="docker build "
run_cmd="docker run "

if [ "$DEBUG" != "true" ] ; then
  build_cmd="docker build --no-cache"
fi

mkdir -p "$curr_dir/output"

# Build base dev image with the correct non-pivileged UID user
$build_cmd \
  --rm \
  -t ethabi-dev \
  --build-arg ETHABI_UID=$(id -u $USER) \
  --file Dockerfile.compile \
  .

$run_cmd \
  --rm \
  -v $curr_dir/output:/home/ethabiuser/output \
  ethabi-dev
