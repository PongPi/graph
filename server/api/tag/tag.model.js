'use strict';

var Model = require('../../config/model');
var checkit  = require('checkit');
var Promise  = require('bluebird');
var Post = require('../post/post.model');
// var bcrypt   = Promise.promisifyAll(require('bcrypt'));

var rules = {
    // name: 'required',
};

var Tag = Model.extend({
    tableName: 'tags',
    idAttribute: 'id',

    posts: function() {
        return this.belongsToMany(Post);
    }
})

module.exports = Tag;