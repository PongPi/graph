'use strict';

angular.module('graphNewsApp')
    .controller('MenuLeftCtrl', function($scope, $rootScope, $location, Auth) {
        var path = $location.path();
        $scope.showMenuLeft = true;
        if(path === "/login"){
          $scope.showMenuLeft = false;
        }
        // $scope.menu = [{
        //     'title': 'Home',
        //     'link': '/'
        // }];

        // $scope.reloadUIKit = function() {
        //     var nav = UIkit.nav($('.uk-nav'));
        // }
        
        // $scope.isCollapsed = true;
        // $scope.isLoggedIn = Auth.isLoggedIn;
        // $scope.isAdmin = Auth.isAdmin;
        // $scope.getCurrentUser = Auth.getCurrentUser;
        // $rootScope.isAdmin = Auth.isAdmin;
        // $scope.logout = function() {
        //     Auth.logout();
        //     $location.path('/login');
        // };
        $scope.isActive = function(route) {
            var path = $location.path();
            //console.log('route isActive', route, path.indexOf(route));
            return !(path.indexOf(route) === -1);
        };

    });
