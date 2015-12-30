'use strict';

angular.module('graphNewsApp')
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'app/index/index.html',
        controller: 'IndexCtrl'
      });
  });
