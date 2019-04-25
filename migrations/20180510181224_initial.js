
exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTable('User', table => {
      table.increments('user_id');
      table.string('email');
      table.string('password');
      table.string('name');
      table.integer('created_at');
      table.integer('updated_at');
    }),
    knex.schema.createTable('File', table => {
      table.increments('file_id');
      table.string('path');
      table.integer('size');
      table.integer('created_at');
    }),
    knex.schema.createTable('URL', table => {
      table.increments('url_id');
      table.integer('creator_id').unsigned();
      table.text('original_url');
      table.text('shortened_url');
      table.text('screenshot');
      table.integer('created_at');
      table.integer('updated_at');
    }),
    knex.schema.createTable('AccessLog', table => {
      table.increments('access_log_id');
      table.integer('url_id').unsigned();
      table.string('source_ip');
      table.integer('created_at');
      table.integer('updated_at');
    })
  ])
    .then(() => Promise.all([
      knex.schema.table('URL', table => {
        table.foreign('creator_id').references('User.user_id');
      })
    ]));
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTable('AccessLog'),
    knex.schema.dropTable('URL'),
    knex.schema.dropTable('File'),
    knex.schema.dropTable('User'),
  ]);
};
