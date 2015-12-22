'use strict';

var path = require('path');
var _ = require('lodash');

var emailTemplate = require('../mail');

function requiredProcessEnv(name) {
  if (!process.env[name]) {
    throw new Error('You must set the ' + name + ' environment variable');
  }
  return process.env[name];
}

// All configurations will extend these options
// ============================================
var all = {
  env: process.env.NODE_ENV,

  // Root path of server
  root: path.normalize(__dirname + '/../../..'),

  // Upload path
  uploadPath: path.normalize(__dirname + '/../../../client/uploads'),

  // Server port
  port: process.env.PORT || 8000,

  // Server IP
  ip: process.env.IP || '0.0.0.0',

  // Should we populate the DB with sample data?
  seedDB: false,

  // Secret for session, you will want to change this and make it an environment variable
  secrets: {
    session: 'go1636-node-secret'
  },

  // List of user roles
  userRoles: ['guest', 'user', 'student', 'mentor', 'admin', 'supperAdmin'],

  // Zoom.us informations
  zoomUs: {
    email: 'lvduit08@gmail.com',
    password: 'just_for_test',
    api_key: 'RCWirhMDQzC5omxebzz3Gg',
    api_secret: 'LFWD7MKH8YD8LsLMA4E89sfL9wf7LwAo6grf'
  },

  mail: {
    config: {
      service: 'smtp',
      domain: "smtp.sendgrid.net",
      host: "smtp.sendgrid.net",
      port: 587,
      authentication: 'plain',

      auth: {
        user: "nicktxw",// "nicktxw",// nmadtu 'go1636service@gmail.com',
        pass: "Project1636",//"Project1636",// 123tranphu '1636gogo'
        sendgrid_api_key: "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",
        template_id : "9dcf8aa0-5a5e-4552-aa5f-2483a6156523"
      }
    },
    options: {
      from: 'Graph News <info@graph.eroshaly.me>', // sender address
      to: '', // list of receivers
      subject: '', // Subject line
      text: '', // plaintext body
      html: '' // html body
    },

    template: emailTemplate
  },
// ActionMailer::Base.smtp_settings = {
//     :address   => "smtp.sendgrid.net",
//     :port      => 587,
//     :domain    => "go1636.com",
//     :user_name => "nmadtu",
//     :password  => "123tranphu",
//     :authentication => 'plain',
//     :enable_starttls_auto => true
//    }
  // MongoDB connection options
  // mongo: {
  //   options: {
  //     db: {
  //       safe: true
  //     }
  //   }
  // },

  facebook: {
    clientID: process.env.FACEBOOK_ID || 'id',
    clientSecret: process.env.FACEBOOK_SECRET || 'secret',
    callbackURL: (process.env.DOMAIN || '') + '/auth/facebook/callback'
  },

  twitter: {
    clientID: process.env.TWITTER_ID || 'id',
    clientSecret: process.env.TWITTER_SECRET || 'secret',
    callbackURL: (process.env.DOMAIN || '') + '/auth/twitter/callback'
  },

  google: {
    clientID: process.env.GOOGLE_ID || 'id',
    clientSecret: process.env.GOOGLE_SECRET || 'secret',
    callbackURL: (process.env.DOMAIN || '') + '/auth/google/callback'
  },

  //href="https://zoom.us/j/393651299"
  
};

// Export the config object based on the NODE_ENV
// ==============================================
module.exports = _.merge(
  all,
  require('./' + process.env.NODE_ENV + '.js') || {});
