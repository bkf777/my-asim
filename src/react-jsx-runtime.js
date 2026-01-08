// Shim for react/jsx-runtime to support React 16 with packages that expect React 17+
const React = require('react');

module.exports = {
  Fragment: React.Fragment,
  jsx: React.createElement,
  jsxs: React.createElement,
};
