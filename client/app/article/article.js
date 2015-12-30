'use strict';

angular.module('graphNewsApp')
  .config(function ($routeProvider) {
    $routeProvider 
      .when('/:id', 
                {
                    templateUrl: function (params) {                      
                      if(params.id.indexOf('article') !== -1){
                        return 'app/article/post/post.html';
                      }else{
                        return 'app/article/category/category.html';
                      }
                    } ,
                    controller: 'ArticleCtrl'
                })           
      });
