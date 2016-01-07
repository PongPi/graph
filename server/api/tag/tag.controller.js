'use strict';

var _ = require('lodash');
var Tag = require('./tag.model');

// Get list of tags
exports.index = function(req, res) {
  Tag.forge()
    .query(function (qb) {
      qb.whereNull('tags.parent_id')
      .orderBy('priority', 'asc')
    })
    .fetchAll({withRelated:['childrens']})
    .then(function (collection) {
      return res.status(200).json(collection)
      // res.json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      return handleError(res, err);
      // res.status(500).json({error: true, data: {message: err.message}});
    });
};

// Get a single tag
exports.show = function(req, res) {
  Tag.findById(req.params.id, function (err, tag) {
    if(err) { return handleError(res, err); }
    if(!tag) { return res.status(404).send('Not Found'); }
    return res.json(tag);
  });
};

// Creates a new tag in the DB.
exports.create = function(req, res) {
  Tag.create(req.body, function(err, tag) {
    if(err) { return handleError(res, err); }
    return res.status(201).json(tag);
  });
};

// Updates an existing tag in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Tag.findById(req.params.id, function (err, tag) {
    if (err) { return handleError(res, err); }
    if(!tag) { return res.status(404).send('Not Found'); }
    var updated = _.merge(tag, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.status(200).json(tag);
    });
  });
};

// Deletes a tag from the DB.
exports.destroy = function(req, res) {
  Tag.findById(req.params.id, function (err, tag) {
    if(err) { return handleError(res, err); }
    if(!tag) { return res.status(404).send('Not Found'); }
    tag.remove(function(err) {
      if(err) { return handleError(res, err); }
      return res.status(204).send('No Content');
    });
  });
};

function handleError(res, err) {
  return res.status(500).send(err);
}