'use strict';

angular.module('graphNewsApp')
    .controller('asideCtrl', function($scope, Post, Ad) {
        $scope.hot_news = [];
        $scope.old_news = [];
        Post.get({id:'aside'}).$promise.then(function(data) {
            $scope.hot_news = data.hot_news;
            $scope.old_news = data.old_news;
           
        }, function(error) {
           // fail
           console.log('fail',error)
        }); 
        $scope.ads = [];     
        Ad.get({
            id:'query',
        // },{
            sort: 'desc',
            limit: '5',
            offset: '0',
            order: 'published_at',
            forge: {
                width : 300, 
                status:'published'
            }
        }).$promise.then(function(data) {
            console.log(data)
            $scope.ads = data.data;
            // $scope.old_news = data.old_news;
           
        }, function(error) {
           // fail
           console.log('fail',error)
        });
    });
