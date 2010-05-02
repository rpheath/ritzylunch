(function($) {
  
  $.fn.setHeight = function() {
    var mainHeight = $('#main').height(), sidebarHeight = $(this).height()
    
    if (mainHeight > sidebarHeight) {
      $(this).height(mainHeight - 40 + 'px')
    }
  }
  
  $.fn.flickrPhotos = function(options) {
    var settings = $.extend({
      limit: 10,
      user_id: '49421777@N07',
      tags: 'ritzy'
    }, options || {})
    
    return $(this).jflickrfeed({
      limit: settings.limit,
      qstrings: {
        id: settings.user_id,
        tags: settings.tags
      },
      itemTemplate: '<li><a href="{{image}}" title="{{title}}"><img src="{{image_s}}" alt="{{title}}" /></a></li>'
    }, function(data) {
      $(this).find('a').facebox().click(function() {
          $('#facebox p.caption').empty()
          if ($(this).attr('title')) $('#facebox p.caption').html($(this).attr('title'))
        }).hoverText()
        $('.inline-loading').remove()
        $('#sidebar .body').setHeight()
    })
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