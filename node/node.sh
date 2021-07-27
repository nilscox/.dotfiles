#!/bin/env bash

source "$(dirname $0)/../functions.sh"

clone_or_pull 'git://github.com/creationix/nvm.git' "$dest/.nvm"

source "$dest/.nvm/nvm.sh"
nvm install --lts
nvm use --lts

npm i -g yarn
npm i -g typescript
npm i -g ts-node
npm i -g http-server
npm i -g nodemon
npm i -g uuid
