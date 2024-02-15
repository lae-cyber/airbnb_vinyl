// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

//filter function
(function(){
  "use strict";
  $("ul.filters > li").on("click", function(e){
    e.preventDefault();
    $("ul.filters > li").removeClass("active");
    $(this).addClass("active");
  });
})(jQuery);
