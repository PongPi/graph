'use strict';

var config = require('../config/environment');
var Promise = require('bluebird');

var knex = require('knex')({
  client: 'mysql',
  connection: config.db,
  debug: ['ComQueryPacket']
});

var bookshelf = require('bookshelf')(knex);
bookshelf.plugin('virtuals')

exports.bookshelf = bookshelf;
module.exports = bookshelf.Model;