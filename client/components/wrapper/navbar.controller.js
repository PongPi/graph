'use strict';

angular.module('graphNewsApp')
  .controller('NavbarCtrl', function ($scope, Tag) {
    $scope.tags = [];
    Tag.query().$promise.then(function(data) {
            console.log(data)
            $scope.tags = data;
            // $scope.old_news = data.old_news;
           
        }, function(error) {
           // fail
           console.log('fail',error)
        });

  });