#!/bin/bash

echo "===> LocalAI All-in-One (AIO) container starting..."

GPU_ACCELERATION=false
GPU_VENDOR=""


PROFILE="cpu" # default to cpu
echo "PROFILE : ${PROFILE}"

export MODELS="${MODELS:-/aio/cpu/embeddings.yaml,/aio/cpu/text-to-speech.yaml,/aio/cpu/image-gen.yaml,/aio/cpu/text-to-text.yaml,/aio/cpu/speech-to-text.yaml,/aio/cpu/vision.yaml}"

echo "MODELS : ${MODELS}"

check_vars

echo "===> Starting LocalAI[$PROFILE] with the following models: $MODELS"

exec /build/entrypoint.sh "$@"
