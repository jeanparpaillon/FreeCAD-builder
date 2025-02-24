#!/bin/bash

set -e

if [ -z "${TOKEN}" ]; then
  echo "TOKEN is not set"
  exit 1
fi

LABEL=${LABEL:-"ubuntu-jammy"}
TEST=${TEST:-"false"}
 
URL=https://github.com/jeanparpaillon/FreeCAD-builder
NAME=runner-${LABEL}-${RANDOM}
WORKFLOW="Local Ubuntu Build"
REF=${REF:-"main"}

docker run -d \
  -e URL=${URL} \
  -e TOKEN=${TOKEN} \
  -v $(pwd):/runner/_work \
  --name ${NAME} \
  runner-${LABEL}
  
gh workflow run "${WORKFLOW}" --repo ${URL} -F test=${TEST} --ref ${REF}

docker logs -f ${NAME}
