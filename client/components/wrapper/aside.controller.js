'use strict';

angular.module('graphNewsApp')
    .controller('asideCtrl', function($scope, Post) {
        $scope.hot_news = [];
        $scope.old_news = [];
        Post.get({id:'aside'}).$promise.then(function(data) {
            $scope.hot_news = data.hot_news;
            $scope.old_news = data.old_news;
           
        }, function(error) {
           // fail
           console.log('fail',error)
        });
    });
