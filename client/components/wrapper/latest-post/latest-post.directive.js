angular.module('graphNewsApp')
.directive("latestPost", function($http, ){
return {
    restrict: 'E',
    replace: true,
    scope: {
        posts: '=posts'
    },
    templateUrl: 'components/wrapper/latest-post/latest-post.html',
    link: function($scope, element, attrs){
        console.log('latestPost' ,$scope)
    }
    };
});