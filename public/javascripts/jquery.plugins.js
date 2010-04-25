(function($) {
  $.fn.setHeight = function() {
    var mainHeight = $('#main').height(), sidebarHeight = $(this).height()
    
    if (mainHeight > sidebarHeight) {
      $(this).height(mainHeight - 40 + 'px')
    }
  }
})(jQuery);