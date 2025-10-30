#!/bin/sh

set -eu

PLATFORM="linux/amd64"

. $(dirname $0)/env.sh

podman build \
    --platform=${PLATFORM} \
    -f Dockerfile.vulkan \
    --target=default-mesa-new \
    -t ${FINAL_IMAGE_REPO}-mesa-new:$VERSION \
    .
