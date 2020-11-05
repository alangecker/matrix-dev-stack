#!/bin/bash
set -e
cd /matrix-dimension

npm config set cache /.npmcache --global

npm install
npm install --no-save --no-package-lock sqlite3 tsc-watch

export NODE_CONFIG_DIR=/config

concurrently -n 'backend,web' \
    "./node_modules/.bin/tsc-watch -p tsconfig-app.json --preserveWatchOutput --onSuccess 'node ./build/app/index.js'" \
    "npm run start:web"
