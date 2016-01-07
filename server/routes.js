/**
 * Main application routes
 */

'use strict';

var errors = require('./components/errors');
var path = require('path');

module.exports = function(app) {

  // Insert routes below
  app.use('/api/ads', require('./api/ad'));
  app.use('/api/banners', require('./api/ad'));
  app.use('/api/tags', require('./api/tag'));
  app.use('/api/posts', require('./api/post'));
  app.use('/auth', require('./auth'));
  app.use('/upload', require('./components/upload'));

  // app.use('/test_mail', require('./api/test_mail'));

  // All undefined asset or api routes should return a 404
  app.route('/:url(api|auth|components|app|lib|assets)/*')
    .get(errors[404]);

  // All other routes should redirect to the index.html
  app.route('/*')
    .get(function(req, res) {
      res.sendFile(path.resolve(app.get('appPath') + '/index.html'));
    });
};