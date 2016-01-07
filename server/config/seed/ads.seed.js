"use strict";
var Ad = require('../../api/ad/ad.model');
var slug = require('slug');

function deleteAds (callback) {
    Ad.forge({})
    .fetchAll()
    .then(function (ads) {
        var ads_arr = ads.toArray(); 
        for (var i = 0; i < ads_arr.length; i++) {
            ads_arr[i].destroy()
              .then(function () {
                console.log('================================ Ad destroyed  ================================');
                console.log('destroyed!');
                console.log('===========================================================================');
                callback();
              })
              .catch(function (err) {
                console.log('================================ Ad destroyed err  ================================');
                console.log(err)
                console.log('===========================================================================');
              });
        };
        callback();
    })
    .catch(function (err) {
      console.log('================================ Ad fetch err  ================================');
        console.log(err)
        console.log('===========================================================================');
    }); 
}

function addAds300x250(priority){
    var html = '<div style="margin-bottom: 20px;\
        background-color: #c9302c;\
        border: 1px solid #ac2925;\
        border-radius: 4px;\
        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);\
        box-shadow: 0 1px 1px rgba(0,0,0,.05);\
        display: inline-block;\
        width:300px;\
        height:250px;\
        ">\
        <p style="height: 250px;\
        line-height: 250px;\
        text-align: center;\
        color: #fff!important;">Banner 300x250</p>\
      </div>';
    Ad.forge({
        title: "Banner 300x250 " +priority,
        slug: slug("Banner 300x250-"+priority+"-"+(new Date().getTime())),
        priority:priority,
        markdown: "" ,
        html: html,
        image: "",
        width: 300,
        height: 250,
        status: 'published' ,
        href: "vn",
        author_id: 1,
        created_at: new Date(),
        created_by: 1,
        updated_at: new Date(),
        updated_by: 1,
        published_at: new Date(),
        published_by: 1
    }).save().then(function (ads) {
          console.log('============================ Ads Success ============================');
          console.log(ads.attributes.title);
          console.log('===========================================================================');
    }).catch(function(err) {
        console.log('================================ Ad err  ================================');
        console.log(err)
        console.log('===========================================================================');
        
    });
}

function addAds160x600(priority){
    var html = '<div style="margin-bottom: 20px;\
        background-color: #c9302c;\
        border: 1px solid #ac2925;\
        border-radius: 4px;\
        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);\
        box-shadow: 0 1px 1px rgba(0,0,0,.05);\
        display: inline-block;\
        width:160px;\
        height:600px;\
        ">\
        <p style="height: 160px;\
        line-height: 600px;\
        text-align: center;\
        color: #fff!important;">Banner 160x600</p>\
      </div>';
    Ad.forge({
        title: "Banner 160x600 "+priority,
        slug: slug("Banner 160x600-"+priority+"-"+(new Date().getTime())),
        priority:priority,
        markdown: "" ,
        html: html,
        image: "",
        width: 160,
        height: 600,
        status: 'published' ,
        href: "vn",
        author_id: 1,
        created_at: new Date(),
        created_by: 1,
        updated_at: new Date(),
        updated_by: 1,
        published_at: new Date(),
        published_by: 1
    }).save().then(function (ads) {
          console.log('============================ Ads Success ============================');
          console.log(ads.attributes.title);
          console.log('===========================================================================');
    }).catch(function(err) {
        console.log('================================ Ad err  ================================');
        console.log(err)
        console.log('===========================================================================');
        
    });
}

function initAds () {
    for(var i = 0; i < 5; i++){
        addAds300x250(i);
        addAds160x600(i);
    }
}
deleteAds(function () {
    initAds();
})
