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
      center: false,
      autoPlay: {
        // autoplay options go gere
        enabled: true,
        pauseOnHover: true
      }
  });  
 
});