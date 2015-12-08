$(function() {

  var months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];

  function renderSite(data) {
    data = $.xml2json(data);
    var posts = data.channel.item;
   
    renderLatestArticles(posts);
  }

  function renderLatestArticles(posts) {
    var $parent = $('.sidebox.latest-articles .sidebox-content');
    if(!$parent) {return};
    console.log('renderLatestArticles', posts);
    for(var i = 0; i < Math.min(posts.length, 5); i++) {
      var p = posts[i];
      var date = new Date(p.pubDate);
      var dateStr = date.getDate() + ' ' + months[date.getMonth()] + ' ' + date.getFullYear();
      var url = p.content && p.content.url ? p.content.url : '';
      var $a = //$('<a href="' + p.link + '"><div class="date">' + dateStr + '</div><div>' + p.title + '</div></a>');
      $('<div class="media">\
          <div class="media-left">\
            <a href="' + p.link + '">\
              <img class="media-object" width="150px" src="'+url+'" alt="' + p.title + '">\
            </a>\
          </div>\
          <div class="media-body">\
            <h5 class="media-heading">' + p.title + '</h5>\
          </div>\
        </div>');
      if(i == 4) {
        $a.addClass('last');
      }
      $parent.append($a);
    }
    
    $parent.removeClass('loading');
  }

  $.ajax({
    dataType: 'xml',
    url: '/rss',
    type: 'GET'
  }).success(renderSite);

});
