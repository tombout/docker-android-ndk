#!/usr/bin/env bash

set -ex

TAGNAME=${DOCKERHUB_USERNAME:?"Dockerhub username not set. Please export DOCKERHUB_USERNAME with you Dockerhub username."}
IMAGE=android-ndk
VERSION=latest

docker build -t ${TAGNAME}/${IMAGE}:${VERSION} .
