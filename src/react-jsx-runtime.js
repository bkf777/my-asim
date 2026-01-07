// React 16 polyfill for jsx-runtime (React 17+)
// This is needed because some amis dependencies expect jsx-runtime
import React from 'react';

export const jsx = React.createElement;
export const jsxs = React.createElement;
export const Fragment = React.Fragment;
export const jsxDEV = React.createElement;
