// Initializes the `user` service on path `/api/user`
const createService = require('feathers-knex');
const hooks = require('./access_log.hooks');

module.exports = function (app) {
  const paginate = app.get('paginate');

  const options = {
    name: 'AccessLog',
    id: 'access_log_id',
    Model: app.get('knexClient'),
    paginate
  };

  // Initialize our service with any options it requires
  app.use('/api/access_log', createService(options));

  // Get our initialized service so that we can register hooks and filters
  const service = app.service('api/access_log');

  service.hooks(hooks);
};
