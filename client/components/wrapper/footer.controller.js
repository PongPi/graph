'use strict';

angular.module('graphNewsApp')
    .controller('footerCtrl', function($scope, Post) {
        $scope.hot_news = [];
        $scope.old_news = [];
        $scope.tags = [];
        Post.get({id:'footer'}).$promise.then(function(data) {
            $scope.hot_news = data.hot_news;
            $scope.old_news = data.old_news;
            $scope.tags = data.tags;
           
        }, function(error) {
           // fail
           console.log('fail',error)
        });
    });
