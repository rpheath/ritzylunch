(function($) {
  
  $.fn.setHeight = function() {
    var mainHeight = $('#main').height(), sidebarHeight = $(this).height()
    
    if (mainHeight > sidebarHeight) {
      $(this).height(mainHeight - 40 + 'px')
    }
  }
  
  $.fn.hoverText = function() {
    return $(this).qtip({
      style: 'flickr',
      position: { 
        corner: { 
          tooltip: 'bottomMiddle', 
          target: 'topMiddle' 
        },
        adjust: {
          y: -62
        }
      }
    })
  }

  $.fn.qtip.styles.flickr = {
    width: 140,
    textAlign: 'center',
    fontSize: 12,
    lineHeight: '130%',
    //backgroundColor: '#500804',
    border: { width: 5, radius: 5, color: '#111' }, // color: '#83170F'
    tip: { corner: 'bottomMiddle' }, 
    name: 'dark'
  }
  
})(jQuery);