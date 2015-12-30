'use strict';

angular.module('graphNewsApp')
  .controller('IndexCtrl', function ($scope, Post) {
    //$scope.message = 'Hello';
    $scope.section = [];
    Post.get({id:'index'}).$promise.then(function(data) {
       // success
       //$scope.todos = todos;
       //console.log('success',data)
       var posts = data.sections
        var filter = _.filter(posts, function (n) {
            console.log(n.posts.length)
            return n.posts.length > 0;
        });
        $scope.sections = filter;
        $scope.recents = data.recents;
       
    }, function(error) {
       // fail
       console.log('fail',error)
    });


  });
