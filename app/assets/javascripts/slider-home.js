$(document).ready(function(){

  //fit page on screen
  var sections = $(".slider-container");
  var height = $(window).height();
  $(".slider-container ul.bxslider li.item img.bg").height(height);


  var slider = $('.bxslider').bxSlider({
    adaptiveHeight: true
  });
  //slider.startAuto();
});