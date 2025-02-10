# service/nodejs/docker/Dockerfile
FROM node:latest

WORKDIR /app

# 依存パッケージインストール用に package.json (および yarn.lock があれば) をコピー
COPY ../src/package.json ./
# COPY ../src/yarn.lock ./  ← yarn.lock を管理している場合は有効にしてください

RUN yarn install

CMD ["npm", "start"]

