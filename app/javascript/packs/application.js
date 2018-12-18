/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import 'bootstrap';

$('.front').click(function(){
  $(this).parents('.card').addClass('flip');
});

$('.flip-button').click(function(){
  $(this).parents('.card').removeClass('flip');
});

$(".exit-button").click(function(){
  console.log('clicking...');
  $(".dose-info").html("<p>lol</p>");
});

$(document).scroll(function () {
  var $nav = $(".navbar-fixed-top");
  var $banner = $(".banner");
  $nav.toggleClass('navbar-wagon-white', $(this).scrollTop() > ($banner.height()/2));
  $(".index-nav-search-box").toggleClass('hide', $(this).scrollTop() < ($banner.height()/2));
  $(".logo-text").toggleClass('hide-logo', $(this).scrollTop() < ($banner.height()/2));
});
