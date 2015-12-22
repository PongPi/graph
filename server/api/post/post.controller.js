'use strict';

var _ = require('lodash');
var Post = require('./post.model');
// var Tag = require('../tag/tag.model');

// Get list of posts
exports.index = function(req, res) {
  Post.fetchAll({withRelated: ['tags','author']}).then(function (posts) {
    return res.status(200).json(posts);
  }).catch(function(err) {
    console.log(err)
    return handleError(res, err);
  });
};

// Get a single post
exports.show = function(req, res) {
  if(req.params.id === 'slug'){
    return exports.showBySlug(req, res);
  }
  Post.where('id', req.params.id)
  .fetch({withRelated: ['tags','author']})
  .then(function (post) {
    return res.status(200).json(post);
  }).catch(function(err) {
    console.log(err)
    return handleError(res, err);
  });
};

// Get a single post
exports.showBySlug = function(req, res) {
  Post.query(function (qb) {
    qb.distinct()
      .innerJoin('posts_tags', function () {
          this.on('posts.id', '=', 'posts_tags.post_id')
      }).innerJoin('tags', function () {
          this.on('tags.id', '=', 'posts_tags.tag_id')
      }).where('tags.slug', '=', req.query.slug)
  })
  .fetchAll({withRelated: ['tags','author',]})
  .then(function (post) {
    return res.status(200).json(post);
  }).catch(function(err) {
    console.log(err)
    return handleError(res, err);
  });
};

function handleError(res, err) {
  return res.status(500).send(err);
}