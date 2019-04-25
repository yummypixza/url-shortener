const app = require('./src/app');

module.exports = {
  production: app.get('mysql'),
  development: app.get('mysql')
};