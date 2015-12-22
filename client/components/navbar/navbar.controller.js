'use strict';

angular.module('graphNewsApp')
  .controller('NavbarCtrl', function ($scope, $rootScope,  $location, Auth, $anchorScroll,$translate) {
    $scope.menu = [{
      'title': 'Home',
      'link': '/'
    }];
    //console.log('NavbarCtrl', $location.path());
    var path = $location.path();
    $scope.showNavbar = true;
    if(path === "/login"){
      $scope.showNavbar = false;
    }

    $scope.isCollapsed = true;
    $scope.isLoggedIn = Auth.isLoggedIn;
    $rootScope.isLoggedIn = Auth.isLoggedIn;
    $scope.isAdmin = Auth.isAdmin;
    $scope.getCurrentUser = Auth.getCurrentUser;

    $scope.isLanding = false;
    if($location.path() === '/' || $location.path() === '/landing'){
      $scope.isLanding = true;
    }



    $scope.gotoid = function(id) {
      var patch = $location.path();
      if(patch == '')
      {
        $location.hash(id);
      }
      else
      {
        $location.path('/').hash(id);
      }
    }
    $scope.logout = function() {
      Auth.logout();
      $location.path('/login');
    };

    $scope.goHome = function(){
        $location.path('/');
    }

    $scope.isActive = function(route) {
      return route === $location.path();
    };

  });