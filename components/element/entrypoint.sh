#!/bin/bash
set -e

export 
cd /matrix-js-sdk
yarn link
yarn install

cd /matrix-react-sdk
yarn link
yarn link matrix-js-sdk
yarn install

cd /element-web
yarn link matrix-js-sdk
yarn link matrix-react-sdk
yarn install

rm /element-web/config.json || true
ln -s /element-config.json /element-web/config.json
yarn start




