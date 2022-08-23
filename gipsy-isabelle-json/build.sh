#!/bin/bash

VERSION="01"

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

# Add formal-methods project
if [ ! -d formal-methods ]; then
  echo "Cloning a fresh shallow copy of formal-methods..."
  git clone --depth 1 --branch master git@bitbucket.org:gipsy-rnd/formal-methods.git
else
  echo "Updating an existing copy of formal-methods..."
  pushd formal-methods
  git pull
  popd
fi

# Build the container
echo -n "Building the container... " && date
sudo docker build -t "gipsy-isabelle-json:$VERSION" -f gipsy-isabelle-json.docker .
date

# EOF
