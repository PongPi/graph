'use strict';

var go1636app = angular.module('graphNewsApp', [
        'ngCookies',
        'ngResource',
        'ngSanitize',
        'ngRoute',
        'ngAnimate',
        'ui.bootstrap',
        'angular-loading-bar',
        'ui.select',
        'ngFileUpload',
        'pascalprecht.translate',
        'easypiechart',
        'textAngular',
        'angular-nicescroll',
        'ngImgCrop'
    ])
    .config(function($routeProvider, $locationProvider, $httpProvider,$translateProvider) {
        // $translateProvider.useStaticFilesLoader({
        //     prefix: 'assets/languages/locale-',
        //     suffix: '.json'
        // });
        // $translateProvider.useLocalStorage();
        // $translateProvider.preferredLanguage('cn');
        $routeProvider
            .otherwise({
                redirectTo: '/'
            });

        $locationProvider.html5Mode(true);
        $httpProvider.interceptors.push('authInterceptor');
    })
   .factory('authInterceptor', function ($rootScope, $q, $cookieStore, $location) {
            return {
                // Add authorization token to headers
                request: function (config) {
                    config.headers = config.headers || {};
                    if ($cookieStore.get('token')) {
                        config.headers.Authorization = 'Bearer ' + $cookieStore.get('token');
                    }
                    return config;
                },
                // Intercept 401s and redirect you to login
                responseError: function (response) {
                    if (response.status == 401) {
                        if($rootScope.isHome !== true){
                            //$location.path('/login');
                            // remove any stale tokens
                            $cookieStore.remove('token');
                        }


                        return $q.reject(response);
                    } else {
                        return $q.reject(response);
                    }
                }
            };
        })
        .run(function ($rootScope, $location, $cookieStore, Auth, $translate,$translateLocalStorage) {
            // Redirect to login if route requires auth and you're not logged in
            $rootScope.$on('$routeChangeStart', function (event, next) {
                // $rootScope.isLoggedIn = Auth.isLoggedIn;
                // if (Auth.isLoggedIn()) {
                // }

                // activeMenu($rootScope, $location);
                // $rootScope.current_path = $location.path();
                // $rootScope.isStudent = Auth.isStudent();
                // $rootScope.isMentor = Auth.isMentor();
                // Auth.isLoggedInAsync(function (loggedIn) {
                //     if (next.authenticate && !loggedIn) {
                //         event.preventDefault();
                //         //$location.path('/login');
                //     } else {
                //         if ($cookieStore.get('token')) {
                //             if ($location.path().indexOf('/login') !== -1) {
                //                 event.preventDefault();
                //                 //$location.path('/student-profile/personal');
                //             }
                //         }
                //     }
                // });
            });
        });

function activeMenu($rootScope, $location) {
    var path = $location.path();

    // switch (path) {
    //     case "/mentor/availability":
    //         $rootScope.title = "Mentor availability";
    //         $rootScope.isMenuActived = 3;
    //         break;
    //     case "/mentor/dashboard":
    //         $rootScope.title = "Mentor Dashboard";

    //         break;
    //     case "/student/dashboard":
    //         $rootScope.title = "My Progress";
    // }

}
