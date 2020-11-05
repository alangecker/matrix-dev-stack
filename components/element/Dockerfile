FROM node:10-buster-slim

RUN apt-get update && apt-get install -y git wget python3 build-essential pkg-config libpixman-1-dev libcairo2-dev libpango1.0-dev libjpeg62-turbo-dev libgif-dev
RUN mkdir /.config /.yarn && chmod 777 /.config /.yarn

ENV YARN_CACHE_FOLDER=/.yarncache
# pre download npm dependencies into cache
RUN mkdir /tmp_project && cd /tmp_project  && git init \
    && wget https://raw.githubusercontent.com/matrix-org/matrix-js-sdk/develop/package.json https://raw.githubusercontent.com/matrix-org/matrix-js-sdk/develop/yarn.lock \
    && yarn install --ignore-scripts && rm -r *

RUN cd /tmp_project \
    && wget https://raw.githubusercontent.com/matrix-org/matrix-react-sdk/develop/package.json https://raw.githubusercontent.com/matrix-org/matrix-react-sdk/develop/yarn.lock \
    && yarn install --ignore-scripts && rm -r *

RUN cd /tmp_project \
    && wget https://raw.githubusercontent.com/vector-im/element-web/develop/package.json https://raw.githubusercontent.com/vector-im/element-web/develop/yarn.lock \
    && yarn install --ignore-scripts && rm -r *


# allow any user accessing the yarn cache
RUN chmod -R 777 /.yarncache

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh