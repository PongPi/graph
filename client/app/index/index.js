'use strict';

angular.module('graphNewsApp')
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'app/index/index.html',
        controller: 'IndexCtrl'
      }).when('/ErrorPages/404.html', {
        templateUrl: 'app/index/404.html',
        controller: 'ErrorPages404Ctrl'
      });
  });
