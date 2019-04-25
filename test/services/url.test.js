const assert = require('assert');
const app = require('../../src/app');

describe('\'url\' service', () => {
  it('registered the service', () => {
    const service = app.service('api/url');

    assert.ok(service, 'Registered the service');
  });
});
