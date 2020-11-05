FROM node:10-buster-slim

RUN apt-get update && apt-get install -y git wget python python-dev python3-dev python3 build-essential pkg-config libpixman-1-dev libcairo2-dev libpango1.0-dev libjpeg62-turbo-dev libgif-dev

RUN mkdir /.config /.npmcache && \
    chmod 777 /.config /.npmcache && \
    npm config set cache /.npmcache --global

RUN npm install -g ts-node nodemon concurrently && \
    npm install -g --unsafe-perm sqlite3

# pre download npm dependencies into cache
RUN mkdir /tmp_project && cd /tmp_project  && git init \
    && wget https://raw.githubusercontent.com/turt2live/matrix-dimension/master/package.json https://raw.githubusercontent.com/turt2live/matrix-dimension/master/package-lock.json \
    && npm install && rm -r *

RUN find /.npmcache -type d -exec chmod 777 {} \; && \
    find /.npmcache -type f -exec chmod 666 {} \;

ENV PYTHON python3
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8082

ENTRYPOINT /entrypoint.sh