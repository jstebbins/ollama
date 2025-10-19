#!/bin/sh

set -eu

PLATFORM="linux/amd64"

. $(dirname $0)/env.sh

podman build \
    --platform=${PLATFORM} \
    ${OLLAMA_COMMON_BUILD_ARGS} \
    -f Dockerfile \
    -t ${FINAL_IMAGE_REPO}:$VERSION \
    .

