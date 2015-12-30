'use strict';

angular.module('graphNewsApp')
  .controller('CategoryCtrl', function ($scope, $routeParams, Post) {
    
    var category = $routeParams.id.replace(".html", "");
    console.log('CategoryCtrl', category); 
    $scope.posts = [];
    $scope.latestPost = [];
    $scope.category = {};
    Post.get({id:'category', category:category}).$promise.then(function(data) {
       // success
       console.log('success',data);
       $scope.posts = data.tag.posts;
       $scope.category = data.tag;
       $scope.latestPost = data.latestPost;       
    }, function(error) {
       // fail
       console.log('fail',error)
    });
  });
