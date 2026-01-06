# Stage 1: Build
# 使用 Node 20 (slim) 镜像，某些依赖需要高版本 Node。
FROM node:20-slim AS build-stage

WORKDIR /app 

# 安装 git，某些依赖项需要从 git 仓库拉取
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 设置 npm 镜像以加速下载，并增加超时时间
RUN npm config set registry https://registry.npmmirror.com && \
    npm config set fetch-retries 5 && \
    npm config set fetch-retry-mintimeout 20000 && \
    npm config set fetch-retry-maxtimeout 120000

# 复制 package.json 和 lock 文件（如果存在）以利用缓存
COPY package.json package-lock.json* ./

# 安装依赖
# 使用 --legacy-peer-deps 以处理可能的依赖冲突
RUN npm install --legacy-peer-deps && \
    npm install -g amis-widget-cli && \
    npm cache clean --force

# 复制源代码
COPY . .

# 设置构建时的内存限制，amis 构建通常需要较多内存
ENV NODE_OPTIONS="--max-old-space-size=4096"

# 执行构建
RUN npm run build

# Stage 2: Serve
FROM nginx:stable-alpine AS production-stage

# 安装 gettext 以使用 envsubst 命令
RUN apk add --no-cache gettext

# 复制构建产物到 nginx 目录
# 根据 amis.config.js，assetsRoot 是 ./demo-6.11.0
COPY --from=build-stage /app/demo-6.11.0 /usr/share/nginx/html

# 复制 nginx 模板配置
COPY nginx.conf /etc/nginx/conf.d/default.conf.template

# 复制环境配置文件和启动脚本
COPY .env /app/.env
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# 默认端口
ENV PORT=3001

# 暴露端口，便于容器运行时直接映射
EXPOSE 3001

# 使用自定义启动脚本
CMD ["/app/entrypoint.sh"]
