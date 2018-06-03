#!/usr/bin/env bash

set -e

# If current directory has file changes then we exit the release script
CHANGES=$(git status --porcelain)
if [ -n "${CHANGES}" ]; then
    echo 'You have uncommitted changes in you files. Please commit them before you use the release script!'
    exit 0
fi

VERSION=${1:?"You have to specify a tag version as first script parameter!"}

# Ensure Dockerfile builds. Otherwise the release script exits.
./build.sh

# Push a tag to Github
git tag -a "${VERSION}" -m "Android NDK ${VERSION}"
git push
git push --tags
