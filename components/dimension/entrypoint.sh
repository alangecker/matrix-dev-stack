#!/bin/bash
set -e
cd /project/src/matrix-dimension

npm config set cache /.npmcache --global

npm install
npm install --no-save --no-package-lock sqlite3

export NODE_CONFIG_DIR=/config
concurrently -n 'backend,backend-tsc,web' \
    "nodemon --watch build/app/ --watch /config/ --ext 'js,yaml' build/app/index.js" \
    "./node_modules/.bin/tsc --watch --preserveWatchOutput -p tsconfig-app.json" \
    "npm run start:web"
    

