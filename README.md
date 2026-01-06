# My ASIM (Amis Editor Demo)

基于 [amis](https://github.com/baidu/amis) 的低代码可视化编辑器演示项目。

## 项目简介

本项目是一个基于 `amis` 和 `amis-editor` 的前端低代码编辑器示例。它允许用户通过拖拽和配置的方式快速构建前端页面，并提供预览和代码导出功能。

## 技术栈

- **amis**: 百度开源的前端低代码框架。
- **React**: 核心 UI 框架。
- **MobX**: 状态管理。
- **TypeScript**: 类型支持。
- **Sass**: 样式处理。

## 快速开始

### 安装依赖

建议使用 `npm` 或 `yarn` 进行安装：

```bash
npm install
# 或者
yarn install
```

### 本地开发

启动开发服务器：

```bash
npm run dev
```

启动后访问 `http://localhost:8080` (具体端口取决于 amis 配置)。

### 项目构建

构建生产环境版本：

```bash
npm run build
```

## 功能特点

- **可视化编辑**: 通过 `amis-editor` 实现拖拽式的页面编辑。
- **丰富的组件库**: 集成了 amis 提供的所有核心组件。
- **实时预览**: 可以在编辑器中直接预览生成的页面效果。
- **多页面管理**: 支持创建和管理多个页面。

## 部署说明

项目包含 `Dockerfile` 和 `nginx.conf`，支持容器化部署。

```bash
docker build -t my-asim .
docker run -p 80:80 my-asim
```

## 许可证

本项目遵循 ISC 许可证。
