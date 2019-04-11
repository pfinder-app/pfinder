#!/usr/bin/env bash

echo "Copy Dist Files"

# manually copy files to platforms folder because we have a "custom" ionic project
cp -r ./dist/* ./platforms/ios/www
