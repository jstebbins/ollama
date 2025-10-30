#!/bin/sh

set -eu

PLATFORM="linux/amd64"

. $(dirname $0)/env.sh

podman build \
    --platform=${PLATFORM} \
    -f Dockerfile.vulkan \
    --target=toolbox-mesa-new \
    -t ${FINAL_IMAGE_REPO}:tb-$VERSION \
    .

podman kill ollama-tb
toolbox rm ollama-tb
toolbox create ollama-tb --image ${FINAL_IMAGE_REPO}:tb-$VERSION \
    -- --device /dev/dri --group-add video --security-opt seccomp=unconfined
