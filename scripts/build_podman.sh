#!/bin/sh

set -eu

. $(dirname $0)/env.sh

podman build \
    --platform=${PLATFORM} \
    ${OLLAMA_COMMON_BUILD_ARGS} \
    -f Dockerfile \
    -t ${FINAL_IMAGE_REPO}:$VERSION \
    .

if echo $PLATFORM | grep "amd64" > /dev/null; then
    podman build \
        --platform=linux/amd64 \
        ${OLLAMA_COMMON_BUILD_ARGS} \
        --build-arg FLAVOR=rocm \
        -f Dockerfile \
        -t ${FINAL_IMAGE_REPO}:$VERSION-rocm \
        .
fi
