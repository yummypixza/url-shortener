const commonHooks = require('feathers-hooks-common');
const moment = require('moment');
const _ = require('lodash');
const randomstring = require('randomstring');
const rp = require('request-promise');
const bluebird = require('bluebird');
const fs = require('fs');
bluebird.promisifyAll(fs);
const {queryWithCurrentUser, associateCurrentUser} = require('feathers-authentication-hooks');
const {authenticate} = require('@feathersjs/authentication').hooks;

const populateViewCount = () => {
  return async context => {
    const knex = context.app.get('knexClient');
    let items = commonHooks.getItems(context);
    items = Array.isArray(items) ? items : [items];

    for (const url of items) {
      if (url.view_count) continue;
      const urlId = url.url_id;
      const viewCountQueryResult = await knex('AccessLog')
        .count('url_id AS view_count')
        .where({ url_id: urlId });
      url.view_count =
        viewCountQueryResult.length > 0
          ? viewCountQueryResult[0].view_count
          : 0;
    }
  };
};

const setTimeNow = () => {
  return context => {
    let items = commonHooks.getItems(context);
    items = Array.isArray(items) ? items : [items];
    for(const item of items){
      const timeNow = moment().valueOf() / 1000;
      item.created_at = timeNow;
      item.updated_at = timeNow;
    }
    return context;
  };
};

const generateShortenedURL = () => {
  return context => {
    let items = commonHooks.getItems(context);
    items = Array.isArray(items) ? items : [items];
    for(const item of items){
      item.shortened_url = randomstring.generate({
        length: 6, readable: true
      });
    }
    return context;
  };
};

const captureScreenshot = () => {
  return async context => {
    const knex = context.app.get('knexClient');
    let items = commonHooks.getItems(context);
    items = Array.isArray(items) ? items : [items];
    const renderTronConfig = context.app.get('rendertron');
    for(const item of items){
      const options = {
        uri: `${renderTronConfig.host}/screenshot/${item.original_url}`,
        encoding: null,
        qs: {
          width: renderTronConfig.screenshot.width,
          height: renderTronConfig.screenshot.height,
        }
      };
      const buffer = await rp(options);
      await fs.writeFileAsync(`${context.app.get('public')}/${item.shortened_url}.jpg`, buffer);
      await knex('File').insert({
        path: `/public/${item.shortened_url}.jpg`,
        size: buffer.length,
        created_at: moment().valueOf() / 1000
      });
      item.screenshot = `/public/${item.shortened_url}.jpg`;
    }
    return context;
  };
};

module.exports = {
  before: {
    all: [],
    find: [
      authenticate('jwt'),
      queryWithCurrentUser({idField: 'user_id', as: 'creator_id'})
    ],
    get: [
      authenticate('jwt'),
      queryWithCurrentUser({idField: 'user_id', as: 'creator_id'})
    ],
    create: [
      commonHooks.when(hook => _.get(hook.params, 'user'), associateCurrentUser({idField: 'user_id', as: 'creator_id'})),
      setTimeNow(),
      generateShortenedURL(),
      captureScreenshot()
    ],
    update: [
      authenticate('jwt')
    ],
    patch: [
      authenticate('jwt')
    ],
    remove: [
      authenticate('jwt')
    ]
  },

  after: {
    all: [],
    find: [
      populateViewCount()
    ],
    get: [
      populateViewCount()
    ],
    create: [],
    update: [],
    patch: [],
    remove: []
  },

  error: {
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
  }
};
