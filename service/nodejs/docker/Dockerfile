# service/nodejs/docker/Dockerfile
FROM node:latest

WORKDIR /app/server

# 依存パッケージインストール用に package.json (および yarn.lock があれば) をコピー
COPY ../server/package.json ./
# COPY ../server/yarn.lock ./  ← yarn.lock を管理している場合は有効にしてください

RUN yarn install

ARG UID
ARG GID

RUN groupmod -g ${GID} node && \
    usermod -u ${UID} -g ${GID} node && \
    mkdir -p /app/server/client && \
    chown -R node:node /app

USER node

CMD ["yarn", "start"]

