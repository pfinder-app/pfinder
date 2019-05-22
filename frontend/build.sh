#!/usr/bin/env bash

# chang to frontend directory
cd "$(dirname "$0")"

# make sure dependencies are up to date
npm install

# build frontend
ionic build
