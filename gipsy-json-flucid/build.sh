#!/bin/bash

VERSION="03-18.04"

# Assumes ssh key was setup with ssh-keygen and uploaded
# to https://bitbucket.org/account/settings/ssh-keys/
if [ ! -d gipsy-src-json-encoder ]; then
  echo "Cloning a fresh shallow copy of gipsy-src-json-encoder, integration branch..."
  git clone --depth 1 --branch integration git@bitbucket.org:gipsy-rnd/gipsy-src-json-encoder.git
else
  echo "Updating an existing copy of gipsy-src-json-encoder, integration branch..."
  pushd gipsy-src-json-encoder
  git pull
  popd
fi

echo "Compiling GIPSY code in gipsy-src-json-encoder..."
pushd gipsy-src-json-encoder/src/gipsy
make
popd

# Build the container
echo -n "Building the container... " && date
sudo docker build -t "gipsy-json-u18:$VERSION" -f gipsy-json-u18.docker .
date

# EOF
