'use strict';

var Model = require('../../config/model');
var checkit  = require('checkit');
var Promise  = require('bluebird');
var Post = require('../post/post.model');
// var bcrypt   = Promise.promisifyAll(require('bcrypt'));

var rules = {
    // name: 'required',
};

var User = Model.extend({
    tableName: 'users',
    idAttribute: 'id',
    
    initialize: function() {
        this.on('saving', this.validateSave);
    },
    validateSave: function() {
        return checkit(rules).run(this.attributes);
    },
    posts: function() {
        return this.hasMany(Post);
    }
})

module.exports = User;

