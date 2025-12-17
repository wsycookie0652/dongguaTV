FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

# 安装构建依赖 (better-sqlite3 需要)
RUN apk add --no-cache --virtual .build-deps \
    python3 \
    make \
    g++ \
    && npm install --production \
    && apk del .build-deps

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
