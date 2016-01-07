'use strict';

var Model = require('../../config/model');
var checkit  = require('checkit');
var Promise  = require('bluebird');
// var Post = require('../post/post.model');
// var bcrypt   = Promise.promisifyAll(require('bcrypt'));

var rules = {
    // name: 'required',
};

var Tag = Model.extend({
    tableName: 'tags',
    idAttribute: 'id',

    posts: function() {
        var Post = require('../post/post.model');
        return this.belongsToMany(Post);
    },
    parents: function() {
        var Tag = require('../tag/tag.model');
        return this.belongsToMany(Tag, 'parent_id');
    },    
    childrens: function() {
        var Tag = require('../tag/tag.model');
        return this.hasMany(Tag, 'parent_id');
    }
})

module.exports = Tag;