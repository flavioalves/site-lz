$(document).ready(function(){

  var height = $(window).height();
  var width = $(window).width();

  $(".slider-container").height(height);

  var useCaltion = ($(".l-home") && $(".l-home").length > 0) ? false : true;

  $(".royalSlider").royalSlider({
      keyboardNavEnabled: true,
      autoScaleSlider: true,
      autoScaleSliderHeight: height,
      autoScaleSliderWidth: width,
      imageScaleMode: 'fill',
      center: false,
      globalCaption: useCaltion,
      autoPlay: {
        enabled: true,
        pauseOnHover: true
      }
  });  
 
});