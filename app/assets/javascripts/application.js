#= require jquery-1.9.1.js
#= require jquery.validate.js
#= require jquery.maskedinput.js
#= require jquery.dotdotdot-1.5.7.js
#= require jquery.mmenu.min.all.js

#= require html5shiv.js
#= require grid.js


#= require headroom.js
#= require jquery.headroom.js
#= require bootstrap/bootstrap.js
#= require royalslider/jquery.royalslider.min.js

#= require slider-home.js
#= require site-menu.js
#= require projetos_portifolio.js
#= require team-member.js
#= require hgrid.js
#= require lightbox.js
#= require refile


$(document).ready(function(){
  var windowWidth = $(window).width();

  $(window).resize(function() {
      if(windowWidth != $(window).width()){
      location.reload();
      return;
      }
  });
});