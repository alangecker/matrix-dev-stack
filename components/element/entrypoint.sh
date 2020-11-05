#!/bin/bash
set -e

export 
cd /project/src/matrix-js-sdk
yarn link
yarn install

cd /project/src/matrix-react-sdk
yarn link
yarn link matrix-js-sdk
yarn install

cd /project/src/element-web
yarn link matrix-js-sdk
yarn link matrix-react-sdk
yarn install

rm /project/src/element-web/config.json || true
ln -s /element-config.json /project/src/element-web/config.json
yarn start




