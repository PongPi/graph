'use strict';

angular.module('graphNewsApp')
  .controller('PostCtrl', function ($scope, $routeParams, Post, $location) {
      
    var params = $routeParams.id.replace(".html", "").split("article-");
    // console.log('PostCtrl', $routeParams, params); 
    var post_id = null;
    if(params.length === 2){
        post_id = params[1];
    }
    $scope.sameTag = [];
    $scope.post = {};
    Post.get({id:post_id}).$promise.then(function(data) {
       // success
       console.log('success',data);
       if(!data.post){
          $location.path('/ErrorPages/404.html');
         }
       $scope.post = data.post;
       $scope.sameTag = data.sameTag; 
       // parse_fb(data.post.url);
    }, function(error) {
       // fail
       console.log('fail',error)
    });
  });
