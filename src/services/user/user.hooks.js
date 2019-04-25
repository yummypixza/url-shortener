const { hashPassword, protect } = require('@feathersjs/authentication-local').hooks;
const commonHooks = require('feathers-hooks-common');
const moment = require('moment');

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

module.exports = {
  before: {
    all: [],
    find: [],
    get: [],
    create: [
      setTimeNow(),
      hashPassword()
    ],
    update: [],
    patch: [],
    remove: []
  },

  after: {
    all: [
      protect('password')
    ],
    find: [],
    get: [],
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
