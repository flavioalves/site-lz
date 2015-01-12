$(document).ready(function(){

  var height = $(window).height();
  var width = $(window).width();

  $(".royalSlider").royalSlider({
      keyboardNavEnabled: true,
      autoScaleSlider: true,
      autoScaleSliderHeight: height,
      autoScaleSliderWidth: width,
      imageScaleMode: 'fill',
      center: false
  });  
 

  /*
  //fit page on screen
  var sections = $(".slider-container");
  var height = $(window).height();
  $(".slider-container ul.bxslider li.item img.bg").height(height);

  var slider = $('.bxslider').bxSlider({
    adaptiveHeight: true
  });
  //slider.startAuto();
  */
});