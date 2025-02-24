#!/bin/sh
set -e

if [ -z "${URL}" ]; then
  echo "URL is required"
  exit 1
fi

if [ -z "${TOKEN}" ]; then
  echo "TOKEN is required"
  exit 1
fi

export RUNNER_ALLOW_RUNASROOT=1 
export DEBIAN_FRONTEND=noninteractive

cd /runner 
./config.sh \
  --url "${URL}" \
  --token "${TOKEN}" \
  --ephemeral
./run.sh
