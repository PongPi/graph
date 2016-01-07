'use strict';

angular.module('graphNewsApp')
  .controller('IndexCtrl', function ($scope, Post, Ad) {
    //$scope.message = 'Hello';
    $scope.section = [];
    Post.get({id:'index'}).$promise.then(function(data) {
       // success
       //$scope.todos = todos;
       //console.log('success',data)
       var posts = data.sections
        var filter = _.filter(posts, function (n) {
            console.log(n.posts.length)
            return n.posts.length > 0;
        });
        $scope.sections = filter;
        $scope.recents = data.recents;
       
    }, function(error) {
       // fail
       console.log('fail',error)
    });
    $scope.ads = [];     
        Ad.get({
            id:'query',
        // },{
            sort: 'desc',
            limit: '1',
            offset: '0',
            order: 'published_at',
            forge: {
                width : 160, 
                status:'published'
            }
        }).$promise.then(function(data) {
            console.log(data)
            $scope.ads = data.data;
            // $scope.old_news = data.old_news;
           resizelayout();
        }, function(error) {
           // fail
           console.log('fail',error)
        });

  });

// $(function() {
//     resizelayout();
// });


function resizelayout () {
  function resizeLeftSection () {
    if( $(window).width() >= 1170){
      var right   = $('#ccr-right-section').width();
      var padding = 15;//parseInt($('#ccr-left-section').css('padding-right'));
      var parent  = $('#ccr-left-section').parent().width();
      console.log(parent,padding,right)
      $('#ccr-left-section').width(parent-padding-right);
    }else{
      $('#ccr-left-section').width('auto');
    }
  }  

  function resizeCarouselSlide () {
    if( $(window).width() >= 1170){
      var right   = $('#banner-wide-skyscraper').width();
      var padding = 40;//parseInt($('#ccr-left-section').css('padding-right'));
      var parent  = $('#carousel-slide').width();
      console.log('resizeCarouselSlide',parent,padding,right)
      $('#carousel-slide-main').width(parent-padding-right);
    }else{
      $('#carousel-slide-main').width('auto');
    }
  }

  $( window ).resize(function() {
    resizeLeftSection();
    resizeCarouselSlide();
  });

  resizeLeftSection();
  resizeCarouselSlide();
}



angular.module('graphNewsApp')
  .controller('ErrorPages404Ctrl', function ($scope, Post, Ad) {

  });