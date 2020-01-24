// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require cocoon
//= require bootstrap-sprockets
//= require_tree .

$(function () {
  $('[data-toggle="popover"]').popover();
});

$(function () {
  $('.linkInThePage').click(function () {
    var hrefValue = $(this).attr('href');
    $(hrefValue).animatescroll({
      padding: 112
    });
  });
});

$(document).ready(function () {
  $('[data-toggle="popover"]').popover();
});


// scroll動くアニメーション
$('#animation').css('visibility', 'hidden');
$(window).scroll(function () {
  console.log('hhhh')
  var windowHeight = $(window).height(),
    topWindow = $(window).scrollTop();
  $('#animation').each(function () {
    var targetPosition = $(this).offset().top;
    if (topWindow > targetPosition - windowHeight + 100) {
      console.log('hhhh')
      $(this).addClass("fadeInDown");
    }
  });
});

// 動き続ける
$(function () {
  setTimeout('rect()'); //アニメーションを実行
});

function rect() {
  $('#rect1,#rect2,#rect3').animate({
    marginTop: '-=10px'
  }, 800).animate({
    marginTop: '+=10px'
  }, 800);
  setTimeout('rect()', 1600); //アニメーションを繰り返す間隔
}