
angular.module('graphNewsApp')
  .factory('Tag', function ($resource) {
    return $resource('/api/tags/:id/:controller', {
      id: '@_id'
    },{
    });
  });