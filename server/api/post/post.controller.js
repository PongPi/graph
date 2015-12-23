'use strict';

var _ = require('lodash');
var Post = require('./post.model');
var Tag = require('../tag/tag.model');
// var Tag = require('../tag/tag.model');

// Get list of posts
exports.index = function(req, res) {
  // Tag.query(function (qb) {
  //   qb.distinct()
  //     .innerJoin('posts_tags', function () {
  //         this.on('tags.id', '=', 'posts_tags.tag_id')
  //     }).innerJoin('posts', function () {
  //         this.on('posts.id', '=', 'posts_tags.post_id')
  //           .limit(5)
  //           .offset(0)
  //           .orderBy('posts.published_at', 'desc')
  //     })
  Tag.fetchAll({withRelated: [{
                'posts': function(qb) {
                  qb.innerJoin('users', function () {
                      this.on('posts.author_id', '=', 'users.id')
                  }).select('posts.*','users.name as author_name');
                  //qb.limit(20);
                  //qb.offset(0);
                  qb.orderBy('published_at', 'desc');
                }
  }]}).then(function (tags) {
    var sections = [];
    var recents = [];
    var tag_arr = tags.toArray()
    for(var x in tag_arr){
      var media = [];
      //console.log()
      if(tag_arr[x].related('posts').toArray().length > 0){
        var chunk_media = _.chunk(tag_arr[x].related('posts').toArray(),6);
        media = chunk_media[0];
        //media = _.drop(tag_arr[x].related('posts').toArray(), 6);
        //console.log('index media.length : ', tag_arr[x].related('posts').toArray().length,media.length);
        if(media.length > 0){
          recents.push(media[0]);
        }
        
      }
      //console.log(tag_arr[x].attributes,.name)
      sections[x]= _.merge(tag_arr[x].attributes,{posts:media});
    }
    return res.status(200).json({sections: sections, recents:recents});
  }).catch(function(err) {
    console.log(err)
    return handleError(res, err);
  });  
  // Post.fetchAll({withRelated: ['tags','author']}).then(function (posts) {
  //   return res.status(200).json(posts);
  // }).catch(function(err) {
  //   console.log(err)
  //   return handleError(res, err);
  // });

};

// Get a single post
exports.show = function(req, res) {
  if(req.params.id === 'slug'){
    return exports.showBySlug(req, res);
  }  
  if(req.params.id === 'index'){
    return exports.index(req, res);
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