'use strict';

var _ = require('lodash');
var Ad = require('./ad.model');

// Get list of ads
exports.index = function(req, res) {
  // Ad.find(function (err, ads) {
  //   if(err) { return handleError(res, err); }
  //   return res.status(200).json(ads);
  // });
  Ad.forge()
    .fetchAll()
    .then(function (collection) {
      return res.status(200).json(collection)
      // res.json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      return handleError(res, err);
      // res.status(500).json({error: true, data: {message: err.message}});
    });
};

// Get list of ads
exports.query = function(req, res) {
  // Ad.find(function (err, ads) {
  //   if(err) { return handleError(res, err); }
  //   return res.status(200).json(ads);
  // });
  console.log('query', req.query)
  var forge = {};
  eval('forge='+req.query.forge);
  // var forge = JSON.parse(req.query.forge) || {};
  var limit = req.query.limit || 1;
  var offset = parseInt(req.query.offset) || 0;
  var order = req.query.order || 'id';
  var sort = req.query.sort || 'desc';
  Ad.forge(forge)
    .query(function(qb) {
                //qb is knex query builder, use knex function here 
                qb
                .where(forge)
                .offset(offset)
                .limit(limit)
                .orderBy(order, sort);
            })
    .fetchAll()
    .then(function (collection) {
      console.log('query collection',collection.length)
      // return res.status(200).json(collection)
      return res.status(200).json({error: false, data: collection.toJSON()});
    })
    .catch(function (err) {
      console.log('query err',err)
      return handleError(res, err);
      // res.status(500).json({error: true, data: {message: err.message}});
    });
};

// Get a single ad
exports.show = function(req, res) {
  // Ad.findById(req.params.id, function (err, ad) {
  //   if(err) { return handleError(res, err); }
  //   if(!ad) { return res.status(404).send('Not Found'); }
  //   return res.json(ad);
  // });
  if(req.params.id == 'query'){
    return exports.query(req, res);
  }
  Ad.forge({id: req.params.id})
    .fetch()
    .then(function (ad) {
      if (!ad) {
        return res.status(404).send('Not Found');
        // res.status(404).json({error: true, data: {}});
      }
      else {
        return res.json(ad);
        // res.json({error: false, data: user.toJSON()});
      }
    })
    .catch(function (err) {
      return handleError(res, err);
      // res.status(500).json({error: true, data: {message: err.message}});
    });
// }
};

// Creates a new ad in the DB.
exports.create = function(req, res) {
  // Ad.create(req.body, function(err, ad) {
  //   if(err) { return handleError(res, err); }
  //   return res.status(201).json(ad);
  // });
  Ad.forge(req.body)
    .save()
    .then(function (ad) {
      return res.status(201).json(ad);
      // res.json({error: false, data: {id: user.get('id')}});
    })
    .catch(function (err) {
      return handleError(res, err);
      // res.status(500).json({error: true, data: {message: err.message}});
    }); 

};

// Updates an existing ad in the DB.
exports.update = function(req, res) {
  if(req.body._id) { delete req.body._id; }
  Ad.findById(req.params.id, function (err, ad) {
    if (err) { return handleError(res, err); }
    if(!ad) { return res.status(404).send('Not Found'); }
    var updated = _.merge(ad, req.body);
    updated.save(function (err) {
      if (err) { return handleError(res, err); }
      return res.status(200).json(ad);
    });
  });
  Ad.forge({id: req.params.id})
    .fetch()
    .then(function (ad) {
      var updated = _.merge(ad.attributes, req.body);
      ad.save(updated)
      .then(function () {
        res.status(200).json(ad);
        // res.json({error: false, data: {message: 'User details updated'}});
      })
      .catch(function (err) {
        return handleError(res, err);
        // res.status(500).json({error: true, data: {message: err.message}});
      });
    })
    .catch(function (err) {
      return handleError(res, err);
      // res.status(500).json({error: true, data: {message: err.message}});
    });
};

// Deletes a ad from the DB.
exports.destroy = function(req, res) {
  // Ad.findById(req.params.id, function (err, ad) {
  //   if(err) { return handleError(res, err); }
  //   if(!ad) { return res.status(404).send('Not Found'); }
  //   ad.remove(function(err) {
  //     if(err) { return handleError(res, err); }
  //     return res.status(204).send('No Content');
  //   });
  // });
  Ad.forge({id: req.params.id})
    .fetch()
    .then(function (ad) {
      ad.destroy()
      .then(function () {
        res.json({error: true, data: {message: 'User successfully deleted'}});
      })
      .catch(function (err) {
        return handleError(res, err);
        // res.status(500).json({error: true, data: {message: err.message}});
      });
    })
    .catch(function (err) {
      return handleError(res, err);
      // res.status(500).json({error: true, data: {message: err.message}});
    });
};

function handleError(res, err) {
  return res.status(500).send(err);
}