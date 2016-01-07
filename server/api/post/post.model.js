'use strict';

var Model = require('../../config/model');
var checkit  = require('checkit');
var Promise  = require('bluebird');



var rules = {
    // name: 'required',
};

var Post = Model.extend({
    tableName: 'posts',
    idAttribute: 'id',
    
    initialize: function() {
        this.on('saving', this.validateSave);
    },

    validateSave: function() {
        return checkit(rules).run(this.attributes);
    },
    tags: function() {
        
        return this.belongsToMany(require('../tag/tag.model'));
    },
    author: function() {
        var User = require('../account/account.model');
        return this.belongsTo(User,'author_id');
    },
    virtuals: {
        url: function() {
            return 'http://localhost:8000/' +this.get('slug') + '-article-' + this.get('id')+'.html';
        }
    }

})




module.exports = Post;