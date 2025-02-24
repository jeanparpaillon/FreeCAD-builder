#!/bin/bash

set -e

LABEL=${LABEL:-"ubuntu-jammy"}
TEST=${TEST:-"false"}
 
. .env

echo $TOKEN

URL=https://github.com/jeanparpaillon/FreeCAD
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
