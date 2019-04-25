const user = require('./user/user.service.js');
const url = require('./url/url.service.js');
const accessLog = require('./access_log/access_log.service');
// eslint-disable-next-line no-unused-vars
module.exports = function (app) {
  app.configure(user);
  app.configure(url);
  app.configure(accessLog);
};
