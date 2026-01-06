/**
 * @file entry of this example.
 */
import './public-path';
import * as React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import '@fortawesome/fontawesome-free/css/all.css';
import '@fortawesome/fontawesome-free/css/v4-shims.css';
import 'amis/lib/themes/cxd.css';
import 'amis/lib/helper.css';
import 'amis/sdk/iconfont.css';
import 'amis-editor-core/lib/style.css';
import './scss/style.scss';
import {setDefaultTheme} from 'amis';
import {setThemeConfig} from 'amis-editor-core';
import themeConfig from 'amis-theme-editor-helper/lib/systemTheme/cxd';

setDefaultTheme('cxd');
setThemeConfig(themeConfig);

function render(props: any) {
  const {container} = props;
  ReactDOM.render(
    <App />,
    container
      ? container.querySelector('#root')
      : document.getElementById('root')
  );
}

if (!(window as any).__POWERED_BY_QIANKUN__) {
  render({});
}

export async function bootstrap() {
  console.log('[react16] amis app bootstraped');
}

export async function mount(props: any) {
  console.log('[react16] amis app mount', props);
  render(props);
}

export async function unmount(props: any) {
  console.log('[react16] amis app unmount');
  const {container} = props;
  ReactDOM.unmountComponentAtNode(
    container
      ? container.querySelector('#root')
      : (document.getElementById('root') as Element)
  );
}
