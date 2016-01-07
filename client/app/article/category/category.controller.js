'use strict';

angular.module('graphNewsApp')
  .controller('CategoryCtrl', function ($scope, $routeParams, Post, $location) {
    
    var category = $routeParams.id.replace(".html", "");
    console.log('CategoryCtrl', category); 
    $scope.posts = [];
    $scope.latestPost = [];
    $scope.category = {};    
    $scope.more = true;
    $scope.init_category = function () {
      // body...
      // console.log({
      //   id : 'category', 
      //   category : category, 
      //   length : $scope.posts.length
      // });
      Post.get({
        id : 'category', 
        category : category, 
        length : ''+$scope.posts.length
      }).$promise.then(function(data) {
         // success
         // console.log('success',data);
         if(!data.tag){
          $location.path('/ErrorPages/404.html');
         }
         if($scope.posts.length === 0){
            $scope.posts = data.tag.posts;
            $scope.category = data.tag;
            $scope.latestPost = data.latestPost;
         }else{
            $scope.posts = $scope.posts.concat(data.tag.posts);
         }   

         if(data.tag.posts.length < 10){
            $scope.more = false;
         }
      }, function(error) {
         // fail
         console.log('fail',error)
      });
     }
    $scope.init_category();
  });
