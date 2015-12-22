'use strict';

angular.module('graphNewsApp')
    .controller('MainCtrl', function($scope, $rootScope, $location, Auth) {
        var path = $location.path();
        $scope.isLoggedInPage = false;
        if(path === "/login"){
          $scope.isLoggedInPage = true;
        }
        

    });
