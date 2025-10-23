#!/bin/sh

set -eu

PLATFORM="linux/amd64"

. $(dirname $0)/env.sh

podman build \
    --platform=${PLATFORM} \
    ${OLLAMA_COMMON_BUILD_ARGS} \
    -f Dockerfile \
    --target=toolbox \
    -t ${FINAL_IMAGE_REPO}:tb-$VERSION \
    .

toolbox create ollama --image ${FINAL_IMAGE_REPO}:tb-$VERSION \
    -- --device /dev/dri --device /dev/kfd --group-add video --group-add render --group-add sudo --security-opt seccomp=unconfined
