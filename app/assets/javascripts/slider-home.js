$(document).ready(function(){

  var height = $(window).height();
  var width = $(window).width();

  $(".slider-container").height(height);
  $(".royalSlider").royalSlider({
      keyboardNavEnabled: true,
      autoScaleSlider: true,
      autoScaleSliderHeight: height,
      autoScaleSliderWidth: width,
      imageScaleMode: 'fill',
      center: false
  });  
 
  //$('.sobre-container').css("margin-top", 200);
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