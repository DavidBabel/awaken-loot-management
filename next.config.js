require('dotenv').config();

const withSass = require('@zeit/next-sass');
const path = require('path');
const Dotenv = require('dotenv-webpack');

module.exports = withSass({
  cssModules: true,
  webpack: config => {
    config.plugins = config.plugins || [];

    config.plugins = [
      ...config.plugins,
      new Dotenv({
        path: path.join(__dirname, '.env'),
        systemvars: true
      })
    ];

    return config;
  }
});
