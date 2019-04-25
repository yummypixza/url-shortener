// Initializes the `url` service on path `/api/url`
const createService = require('feathers-knex');
const hooks = require('./url.hooks');

module.exports = function (app) {
  const paginate = app.get('paginate');

  const options = {
    name: 'URL',
    id: 'url_id',
    Model: app.get('knexClient'),
    paginate
  };

  // Initialize our service with any options it requires
  app.use('/api/url', createService(options));

  // Get our initialized service so that we can register hooks and filters
  const service = app.service('api/url');

  service.hooks(hooks);
};
