$(document).ready(function(){

  //fit page on screen
  var sections = $(".slider-container");
  var height = $(window).height();
  $(".slider-container ul.bxslider li.item").height(height);


  var slider = $('.bxslider').bxSlider();
  slider.startAuto();
});