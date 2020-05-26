#!/bin/bash

set -e

if [ ! -d "${PROFILES}" ]
then
  logger "ERR: cannot find 'profiles' folder in WORDKIR ${WORKDIR}"
  exit 1
fi

logger "Installing additional core packages"

cp -f files/core.packages "${PROFILES}"

pushd "${WORKDIR}" > /dev/null

build-simple-cdd --force-root --profiles core

popd > /dev/null