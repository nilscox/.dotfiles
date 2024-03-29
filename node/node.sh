#!/bin/env bash

source "$DOT/functions.sh"
set -xeo pipefail

clone_or_pull 'https://github.com/nvm-sh/nvm.git' "$dest/.nvm"

source "$dest/.nvm/nvm.sh"
nvm install --lts
nvm use --lts

npm i -g yarn
npm i -g typescript
npm i -g ts-node
npm i -g nodemon
npm i -g uuid
