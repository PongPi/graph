/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

"use strict";
//Seed Folder

// require("./seed/User.js");
// var Program = require("../api/program/program.model");
var Post = require('../api/post/post.model');
var Tag = require('../api/tag/tag.model');
var slug = require('slug');
var Model = require('../config/model');
var PostsTags = Model.extend({
    tableName: 'posts_tags',
    idAttribute: 'id',
})
var images = ['/content/images/1.jpg',
'/content/images/2.jpg',
'/content/images/3.jpg',
'/content/images/4.jpg',
'/content/images/5.jpg',
'/content/images/6.jpg',
'/content/images/7.jpg',
'/content/images/8.jpg',
'/content/images/9.jpg',
'/content/images/10.jpg',
'/content/images/11.jpg',
'/content/images/12.jpg',
'/content/images/13.jpg',
'/content/images/14.jpg',
'/content/images/15.jpg',
'/content/images/16.jpg',
'/content/images/17.jpg',
'/content/images/18.jpg',
'/content/images/19.jpg',
'/content/images/20.jpg',
'/content/images/21.jpg',
'/content/images/22.jpg',
'/content/images/23.jpg',
'/content/images/24.jpg',
'/content/images/25.jpg',
'/content/images/26.jpg',
'/content/images/27.jpg',
'/content/images/28.jpg',
'/content/images/29.jpg',
'/content/images/30.jpg',
'/content/images/31.jpg',
'/content/images/32.jpg',
'/content/images/33.jpg',
'/content/images/34.jpg',
'/content/images/35.jpg',
'/content/images/36.jpg',
'/content/images/37.jpg',
'/content/images/1.jpg',
'/content/images/2.jpg',
'/content/images/3.jpg',
'/content/images/4.jpg',
'/content/images/5.jpg',
'/content/images/6.jpg',
'/content/images/7.jpg',
'/content/images/8.jpg',
'/content/images/9.jpg',
'/content/images/10.jpg',
'/content/images/11.jpg',
'/content/images/12.jpg',
'/content/images/13.jpg',
'/content/images/14.jpg',
'/content/images/15.jpg',
'/content/images/16.jpg',
'/content/images/17.jpg',
'/content/images/18.jpg',
'/content/images/19.jpg',
'/content/images/20.jpg',
'/content/images/21.jpg',
'/content/images/22.jpg',
'/content/images/23.jpg',
'/content/images/24.jpg',
'/content/images/25.jpg',
'/content/images/26.jpg',
'/content/images/27.jpg',
'/content/images/28.jpg',
'/content/images/29.jpg',
'/content/images/30.jpg',
'/content/images/31.jpg',
'/content/images/32.jpg',
'/content/images/33.jpg',
'/content/images/34.jpg',
'/content/images/35.jpg',
'/content/images/36.jpg',
'/content/images/37.jpg'];

var html = "<div class='the-article-body'>\<table class='picture' align='center'>\    <tbody>\        <tr>\            <td class='pic'>\
<img alt='Mở đầu bộ tranh mới, Sói Mặt Đơ và Khăn Đỏ lần lượt hỏi nhau về năm 2020. Bộ đôi đáng yêu này đưa ra những mong muốn, ý tưởng cho tương lai. Tất cả được tác giả Tạ Quốc Kỳ Nam thể hiện hài hước, dí dỏm qua câu thoại và nét vẽ.' src='http://img.v3.news.zdn.vn/w660/Uploaded/wyhktpu/2015_12_25/hoy_di_nha_1.jpg'>\
<a href='#slideshow' class='btnSlideshow'>\
Phóng to</a>\
<div class='fbShareImage'>\
<span class='ti-facebook'>\
</span>\
 Chia sẻ</div>\
</td>\        </tr>\        <tr>\            <td class='pCaption caption'>\
Mở đầu bộ tranh mới, Sói Mặt Đơ và Khăn Đỏ lần lượt hỏi nhau về năm 2020. Bộ đôi đáng yêu này đưa ra những mong muốn, ý tưởng cho tương lai. Tất cả được tác giả Tạ Quốc Kỳ Nam thể hiện hài hước, dí dỏm qua câu thoại và nét vẽ.</td>\        </tr>\    </tbody>\</table>\<table class='picture' align='center'>\    <tbody>\        <tr>\            <td class='pic'>\
<img alt='Tương lai của Bitch Quàng Khăn Đỏ là là môi trường sống trong lành, nhiều cây xanh ngay giữa những thành phố hiện đại; cũng không còn nạn chặt cây, phá rừng để bà ngoại có thể sống ở nơi xanh mát mà không cần dọn vào rừng.' src='http://img.v3.news.zdn.vn/w660/Uploaded/wyhktpu/2015_12_25/hoy_di_nha_3.jpg'>\
<a href='#slideshow' class='btnSlideshow'>\
Phóng to</a>\
<div class='fbShareImage'>\
<span class='ti-facebook'>\
</span>\
 Chia sẻ</div>\
</td>\        </tr>\        <tr>\            <td class='pCaption caption'>\
Tương lai của Bitch Quàng Khăn Đỏ là là môi trường sống trong lành, nhiều cây xanh ngay giữa những thành phố hiện đại; cũng không còn nạn chặt cây, phá rừng để bà ngoại có thể sống ở nơi xanh mát mà không cần dọn vào rừng.</td>\        </tr>\    </tbody>\</table>\<table class='picture' align='center'>\    <tbody>\        <tr>\            <td class='pic'>\
<img alt='Bitch Quàng Khăn Đỏ mong muốn trong tương lai cuộc sống được hỗ trợ bởi nhiều phát kiến công nghệ, ví dụ máy in 3D biến món ăn từ ảnh chụp trở thành đồ ăn thật, các phương tiện giao thông giúp di chuyển nhanh như chớp hay dụng cụ dịch chuyển đồ vật qua mạng chỉ bằng một cái click chuột để Khăn Đỏ không phải băng rừng đem bánh cho bà ngoại.' src='http://img.v3.news.zdn.vn/w660/Uploaded/wyhktpu/2015_12_25/hoy_di_nha_5.jpg'>\
<a href='#slideshow' class='btnSlideshow'>\
Phóng to</a>\
<div class='fbShareImage'>\
<span class='ti-facebook'>\
</span>\
 Chia sẻ</div>\
</td>\        </tr>\        <tr>\            <td class='pCaption caption'>\
Bitch Quàng Khăn Đỏ mong muốn trong tương lai cuộc sống được hỗ trợ bởi nhiều phát kiến công nghệ, ví dụ máy in 3D biến món ăn từ ảnh chụp trở thành đồ ăn thật, các phương tiện giao thông giúp di chuyển nhanh như chớp hay dụng cụ dịch chuyển đồ vật qua mạng chỉ bằng một cái click chuột để Khăn Đỏ không phải băng rừng đem bánh cho bà ngoại.</td>\        </tr>\    </tbody>\</table>\<table class='picture' align='center'>\    <tbody>\        <tr>\            <td class='pic'>\
<img alt='Sói Mặt Đơ thì hy vọng vào năm 2020 Quạ Con Chúm Chím và trẻ em được tiêm phòng đầy đủ, không bị cận thị khi trót sử dụng máy tính quá nhiều và các phát kiến y học sẽ kết hợp với công nghệ để phát triển mạnh mẽ, giúp con người hạn chế bệnh tật. Còn bà ngoại của Khăn Đỏ sẽ sở hữu smartphone “văn minh”, có khả năng tích hợp và ẩn gọn, hỗ trợ con người mọi thứ trong cuộc sống.' src='http://img.v3.news.zdn.vn/w660/Uploaded/wyhktpu/2015_12_25/hoy_di_nha_7.jpg'>\
<a href='#slideshow' class='btnSlideshow'>\
Phóng to</a>\
<div class='fbShareImage'>\
<span class='ti-facebook'>\
</span>\
 Chia sẻ</div>\
</td>\        </tr>\        <tr>\            <td class='pCaption caption'>\
Sói Mặt Đơ thì hy vọng vào năm 2020 Quạ Con Chúm Chím và trẻ em được tiêm phòng đầy đủ, không bị cận thị khi trót sử dụng máy tính quá nhiều và các phát kiến y học sẽ kết hợp với công nghệ để phát triển mạnh mẽ, giúp con người hạn chế bệnh tật.&nbsp;</td>\        </tr>\    </tbody>\</table>\<table class='picture' align='center'>\    <tbody>\        <tr>\            <td class='pic'>\
<img alt='Cuộc hội thoại của Sói Mặt Đơ và Khăn Đỏ trong “Hoy đi nha” không chỉ mang tính hài hước, giải trí mà thể hiện sức sáng tạo của Tạ Quốc Kỳ Nam về cuộc sống tương lai năm 2020. Theo tác giả, bộ tranh được lấy cảm hứng từ cuộc thi “Tương lai là…” do Samsung tổ chức. Đây là cuộc thi kêu gọi các bạn trẻ chia sẻ ước mơ, hình dung của mình về bản thân, ngôi nhà và thành phố trong tương lai.' src='http://img.v3.news.zdn.vn/w660/Uploaded/wyhktpu/2015_12_25/hoy_di_nha_9.jpg'>\
<a href='#slideshow' class='btnSlideshow'>\
Phóng to</a>\
<div class='fbShareImage'>\
<span class='ti-facebook'>\
</span>\
 Chia sẻ</div>\
</td>\        </tr>\        <tr>\            <td class='pCaption caption'>\
Còn bà ngoại của Khăn Đỏ sẽ sở hữu smartphone “văn minh”, có khả năng tích hợp và ẩn gọn, hỗ trợ con người mọi thứ trong cuộc sống.&nbsp;</td>\        </tr>\    </tbody>\</table>\<table class='picture' align='center'>\    <tbody>\        <tr>\            <td class='pic'>\
<img alt='Truy cập vào website www.tuonglaila.com, Kỳ Nam bắt gặp nhiều ý tưởng sáng tạo, bay bổng và giàu tính nhân văn, từ đó có cảm hứng tạo ra đời “Hoy đi nha” phiên bản tương lai. Thông qua bộ tranh, tác giả muốn khuyến khích các bạn trẻ cùng tham chia sẻ suy nghĩ về tương lai đến mọi người. Biết đâu với sức mạnh của công nghệ hiện đại, những ý tưởng đó sẽ trở thành hiện thực.' src='http://img.v3.news.zdn.vn/w660/Uploaded/wyhktpu/2015_12_25/hoy_di_nha_11.jpg'>\
<a href='#slideshow' class='btnSlideshow'>\
Phóng to</a>\
<div class='fbShareImage'>\
<span class='ti-facebook'>\
</span>\
 Chia sẻ</div>\
</td>\        </tr>\        <tr>\            <td class='pCaption caption'>\
Cuộc hội thoại của Sói Mặt Đơ và Khăn Đỏ trong “Hoy đi nha” không chỉ mang tính hài hước, giải trí mà thể hiện sức sáng tạo của Tạ Quốc Kỳ Nam về cuộc sống tương lai năm 2020. Theo tác giả, bộ tranh được lấy cảm hứng từ cuộc thi “Tương lai là…” do Samsung tổ chức. Đây là cuộc thi kêu gọi các bạn trẻ chia sẻ ước mơ, hình dung của mình về bản thân, ngôi nhà và thành phố trong tương lai.&nbsp;</td>\        </tr>\    </tbody>\</table>\<table class='picture' align='center'>\    <tbody>\        <tr>\            <td class='pic'>\
<img alt='Truy cập vào website www.tuonglaila.com, Kỳ Nam bắt gặp nhiều ý tưởng sáng tạo, bay bổng và giàu tính nhân văn, từ đó có cảm hứng tạo ra đời “Hoy đi nha” phiên bản tương lai. Thông qua bộ tranh, tác giả muốn khuyến khích các bạn trẻ cùng tham chia sẻ suy nghĩ về tương lai đến mọi người. Biết đâu với sức mạnh của công nghệ hiện đại, những ý tưởng đó sẽ trở thành hiện thực.' src='http://img.v3.news.zdn.vn/w660/Uploaded/wyhktpu/2015_12_25/hoy_di_nha_13.jpg'>\
<a href='#slideshow' class='btnSlideshow'>\
Phóng to</a>\
<div class='fbShareImage'>\
<span class='ti-facebook'>\
</span>\
 Chia sẻ</div>\
</td>\        </tr>\        <tr>\            <td class='pCaption caption'>\
Truy cập vào website <a href='http://www.tuonglaila.com' target='_blank'>\
www.tuonglaila.com</a>\
, Kỳ Nam bắt gặp nhiều ý tưởng sáng tạo, bay bổng và giàu tính nhân văn, từ đó có cảm hứng tạo ra đời “Hoy đi nha” phiên bản tương lai. Thông qua bộ tranh, tác giả muốn khuyến khích các bạn trẻ cùng tham chia sẻ suy nghĩ về tương lai đến mọi người. Biết đâu với sức mạnh của công nghệ hiện đại, những ý tưởng đó sẽ trở thành hiện thực.</td>\        </tr>\    </tbody>\</table>\<div class='notebox ncenter'>\<p>\
Để cùng chia sẻ với Tạ Quốc Kỳ Nam cũng như nhiều bạn trẻ khác về ước mơ trong tương lai, độc giả có thể truy cập &nbsp;<a href='http://www.tuonglaila.com/' target='_blank'>\
www.tuonglaila.com</a>\
&nbsp;để tham gia cuộc thi “Tương lai là…” và nhận nhiều quà tặng hấp dẫn.</p>\</div>\</div>\
";
var introduce ="Sau thời gian vắng bóng, bộ tranh “Hoy đi nha” của tác giả Tạ Quốc Kỳ Nam đã trở lại với những ý tưởng thú vị và hài hước về tương lai năm 2020."; 


function initPost () {
    Tag.fetchAll().then(function (tags) {
        var tag_arr = tags.toArray(); 
        for(var x in tag_arr){
            for(var i = 0; i < 10; i++){
                addPost(tag_arr[x], i);
            }
        }
        
    }).catch(function(err) {
        console.log(err) 
    }); 
}
function deleteAllPost (callback) {
    var detete_post = [];
    Post.fetchAll().then(function (posts) {
        var post_arr = posts.toArray(); 
        if(post_arr.length > 0){
            for(var x in post_arr){
                deletePost (post_arr[x].attributes.id, function (post_id) {
                    detete_post.push(post_id);
                    if(detete_post.length === post_arr.length){
                        callback();
                    }
                })
            }
        }else{
            callback();
        }
    }).catch(function(err) {
    console.log(err)
  }); 
}
function deletePost (post_id, callback) {
    Post.forge({id: post_id})
    .fetch().then(function (item) {
        if(item){
            return item.destroy().then(function () {          
                console.log('================================ Post destroyed  ================================');
                console.log('destroyed!');
                console.log('===========================================================================');
                callback(post_id);
            }).catch(function(err) {
                console.log('================================ Post destroyed err  ================================');
                console.log(err)
                console.log('===========================================================================');
                initPost();
            }); 
        }else{
            console.log('================================ PostsTags NULL  ================================');
            console.log('Posts NULL:', post_id);
            console.log('===========================================================================');
            callback(post_id);
        }              
    });
}
detetePostsTags(function () {
    console.log('================================ PostsTags destroyed  ================================');
    console.log('detete PostsTags success!');
    console.log('===========================================================================');
    deleteAllPost(function () {
        console.log('================================ Posts destroyed  ================================');
        console.log('detete Posts success!');
        console.log('===========================================================================');
        initPost();
    });
});
function detetePostsTags (callback) {
    var detete_post_tag = [];
    Post.fetchAll().then(function (posts) {
        var post_arr = posts.toArray(); 
        if(post_arr.length > 0){
            for(var x in post_arr){
                detetePostsTag (post_arr[x].attributes.id, function (post_id) {
                    detete_post_tag.push(post_id);
                    if(detete_post_tag.length === post_arr.length){
                        callback();
                    }
                })
            }
        }else{
            callback();
        }
    });
}
function detetePostsTag (post_id, callback) {
    PostsTags
    .forge({post_id: post_id})
    .fetch()
    .then(function (item) {
        if(item){
            return item.destroy().then(function () {
              
                console.log('================================ PostsTags destroyed  ================================');
                console.log('detetePostsTags:', post_id);
                console.log('===========================================================================');
                callback(post_id);
            }).catch(function(err) {
                console.log('================================ Post destroyed err  ================================');
                console.log(err)
                console.log('===========================================================================');
                
            });
        }else{
            console.log('================================ PostsTags NULL  ================================');
            console.log('PostsTags NULL:', post_id);
            console.log('===========================================================================');
            callback(post_id);
        }
    }).catch(function(err) {
        console.log('================================ PostsTags destroyed err  ================================');
        console.log(err)
        console.log('===========================================================================');
            
    });
}
function addPost(tagObject,i){
    var tag = tagObject;
    Post.forge({uuid: Math.round(+new Date()/1000),
        title: tag.attributes.name + ' - ' + i+ " - Bộ tranh 'Hoy đi nha' phiên bản mới thu hút dân mạng",
        introduce: introduce,
        slug: slug(tag.attributes.name + ' - ' + i + " - Bộ tranh 'Hoy đi nha' phiên bản mới thu hút dân mạng"),
        markdown: "" ,
        html: html,
        image: images[Math.floor(Math.random() * images.length)],
        featured: 1,
        page: 0,
        status: 'published' ,
        language: "vn",
        meta_title: tag.attributes.name + ' - ' + i+ " - Bộ tranh 'Hoy đi nha' phiên bản mới thu hút dân mạng",
        meta_description: tag.attributes.name + ' - ' + i+ " - Bộ tranh 'Hoy đi nha' phiên bản mới thu hút dân mạng",
        author_id: 1,
        created_at: new Date,
        created_by: 1,
        updated_at: new Date,
        updated_by: 1,
        published_at: new Date,
        published_by: 1
    }).save().then(function (post) {
        post.tags().attach(tag).then(function (relation) {
          console.log('============================ Post attached tag ============================');
          console.log(tag.attributes.name, i);
          console.log('===========================================================================');
          //console.log('===========================================================================');
        }).catch(function(err) {
          console.log('============================ Post attached err  ===========================');
          console.log(err)
          console.log('===========================================================================');
        });
    }).catch(function(err) {
        console.log('================================ Post err  ================================');
        console.log(err)
        console.log('===========================================================================');
        
    });
}