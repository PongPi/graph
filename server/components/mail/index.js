'use strict';

var _ = require('lodash');
var config = require('../../config/environment');
var sendgrid = require('sendgrid')(config.mail.config.auth.sendgrid_api_key);

module.exports.sendgrid = sendgrid;

module.exports.send = function(options, callback) {
    var mailOptions = _.merge(config.mail.options, options);

    var email = new sendgrid.Email();
    email.addTo(mailOptions.to);
    email.subject = mailOptions.subject;
    email.from = mailOptions.from;
    email.text = mailOptions.text;
    email.html = mailOptions.html;

    email.addFilter('templates', 'enable', 1);
    email.addFilter('templates', 'template_id', config.mail.config.auth.template_id);

    sendgrid.send(email, function(error, info) {
        if (callback) return callback(error, info);
        if (error) {
            return console.log(error);
        }
        console.log('Message sent: ' + info);
    });
};