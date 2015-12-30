'use strict';

var _ = require('lodash');
var Post = require('./post.model');
var Tag = require('../tag/tag.model');
// var Tag = require('../tag/tag.model');

// Get list of posts
exports.index = function(req, res) {
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
};

function latestPost (callback) {
  Post.query(function(qb) {
                //qb is knex query builder, use knex function here 
                
                qb
                .offset(0)
                .limit(10)
                .orderBy('published_at', 'desc');
            })
  .fetchAll({withRelated: ['tags','author']})
  .then(function (posts) {
    console.log('===========================latestPost',posts)
    return callback(false,posts);
  }).catch(function(err) {
    return callback(err,[]);
    console.log('latestPost',err)
    //return handleError(res, err);
  });
}

// Get list of posts
exports.category = function(req, res) {  
  console.log('category', req.query.category);
  new Tag({'slug':req.query.category})
  .fetch({withRelated: [{
                'posts': function(qb) {
                  qb.innerJoin('users', function () {
                      this.on('posts.author_id', '=', 'users.id')
                  }).select('posts.*','users.name as author_name');
                  qb.orderBy('published_at', 'desc');
                  qb.limit(10);
                  qb.offset(0);
                }
  }]}).then(function (tag) {
    latestPost(function (error, posts) {
      return res.status(200).json({tag: tag, latestPost: posts});
    });
    
  }).catch(function(err) {
    console.log(err)
    return handleError(res, err);
  });  
};
// Get list of posts
exports.aside = function(req, res) {
  Post
  .fetchAll({withRelated: ['tags','author']})
  .then(function (posts) {
    var chunk_media = _.chunk(posts.toArray(),5);
    return res.status(200).json({
      'hot_news':  chunk_media[0], 
      'old_news':  chunk_media[1]
    });
  }).catch(function(err) {
    console.log(err)
    return handleError(res, err);
  });

};
function sameTag (tag_id,callback) {
  Post.query(function(qb) {
                //qb is knex query builder, use knex function here 
                qb
                .leftJoin('posts_tags', 'posts.id', 'posts_tags.post_id')
                .leftJoin('tags', 'tags.id', 'posts_tags.tag_id')
                .where({
                  'tags.id': tag_id,
                })
                .offset(0)
                .limit(10)
                .orderBy('published_at', 'desc');
            })
  .fetchAll({withRelated: ['tags','author']})
  .then(function (posts) {
    console.log('===========================sameTag',posts)
    return callback(false,posts);
  }).catch(function(err) {
    return callback(err,[]);
    console.log('sameTag',err)
    //return handleError(res, err);
  });
}
// Get a single post
exports.show = function(req, res) {
  if(req.params.id === 'slug'){
    return exports.showBySlug(req, res);
  }  
  if(req.params.id === 'index'){
    return exports.index(req, res);
  }  
  if(req.params.id === 'aside'){
    return exports.aside(req, res);
  }  
  if(req.params.id === 'category'){
    return exports.category(req, res);
  }
  Post.where('id', req.params.id)
  .fetch({withRelated: ['tags','author']})
  .then(function (post) {
    var tags = post.related('tags').toArray();
    sameTag(tags[0].attributes.id,function (error, posts) {
      return res.status(200).json({post: post, sameTag: posts});
    });
    // return res.status(200).json(post);
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