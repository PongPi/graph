'use strict';

angular.module('graphNewsApp')
  .factory('Post', function ($resource) {
    return $resource('/api/posts/:id/:controller', {
      id: '@_id'
    },{
      update: {
        method: 'PUT',
      },
    });
  });
