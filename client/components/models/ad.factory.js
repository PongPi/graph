'use strict';

angular.module('graphNewsApp')
  .factory('Ad', function ($resource) {
    return $resource('/api/banners/:id/:controller', {
      id: '@_id'
    },{
    });
  });
