'use strict';

angular.module('graphNewsApp')
.filter('currentTime',['$filter',  function($filter) {
    return function() {
        return $filter('date')(new Date(), 'HH:mm');
    };
}])