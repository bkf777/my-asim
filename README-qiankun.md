# AMIS 可视化编辑器 - Qiankun 子应用

这是一个配置为 qiankun 子应用的 React 16 + Webpack 5 项目，集成了 AMIS 可视化编辑器。

## 已完成的配置

### 1. qiankun 子应用配置

- ✅ Webpack 配置已更新为支持 qiankun 子应用
  - 设置 `libraryTarget: 'umd'`
  - 设置 `publicPath` 为 `http://localhost:3001/`
  - 配置 CORS headers

### 2. 生命周期钩子

- ✅ 在 `src/index.tsx` 中已实现 qiankun 必需的生命周期函数：
  - `bootstrap()` - 应用初始化
  - `mount(props)` - 应用挂载
  - `unmount(props)` - 应用卸载
  - `update(props)` - 可选更新钩子

### 3. AMIS 编辑器集成

- ✅ 已安装 `amis@6.13.0` 和 `amis-editor@6.13.0`
- ✅ 在 `src/App.tsx` 中集成了 Editor 组件
- ✅ 添加了必要的样式文件：
  - `amis/lib/themes/cxd.css`
  - `amis-editor/dist/style.css`
- ✅ 已安装 `sass-loader` 以支持样式加载

### 4. 开发依赖

- ✅ 已安装 `sass` 和 `sass-loader` 用于样式处理

## 本地运行

### 独立运行（开发模式）

```bash
npm start
```

应用将在 `http://localhost:3001` 启动

### 构建

```bash
npm run build
```

构建产物将输出到 `dist` 目录

## 作为 Qiankun 子应用使用

### 在主应用中注册

```javascript
import { registerMicroApps, start } from 'qiankun';

registerMicroApps([
  {
    name: 'amis-editor',
    entry: '//localhost:3001',
    container: '#container',
    activeRule: '/amis-editor',
  },
]);

start();
```

### 子应用配置说明

- **应用名称**: amis-editor（可自定义）
- **入口地址**: http://localhost:3001
- **容器**: 主应用中用于挂载子应用的DOM节点
- **激活规则**: 当路由匹配 `/amis-editor` 时激活

## AMIS 编辑器功能

当前集成的编辑器包含：

- 可视化页面编辑
- 组件拖拽配置
- 属性面板编辑
- 实时预览
- Schema 导入导出

默认示例包含一个表单，包含姓名和邮箱输入框。

## 技术栈

- React 16.14.0
- Webpack 5
- TypeScript
- AMIS 6.13.0
- AMIS Editor 6.13.0
- Qiankun 微前端框架

## 注意事项

1. 确保主应用已配置 qiankun
2. 子应用必须通过 HTTP 协议访问（不能使用 file://）
3. 开发时需确保子应用服务运行在 3001 端口
4. 生产环境部署时需正确配置 publicPath
