$(function() {
  $('a[rel=facebox]').facebox()
  
  $('a[rel=external]').click(function(e) {
    e.preventDefault()
    window.open(this.href)
  })
  
  $('#sidebar .body').setHeight()
  
  $('ul.flickr').jflickrfeed({
		limit: 10,
		qstrings: {
			id: '95448703@N00', // '49421777@N07'
			tags: 'rpheath'     // 'bikenight'
		},
		itemTemplate: '<li><a href="{{image}}" title="{{title}}"><img src="{{image_s}}" alt="{{title}}" /></a></li>'
	}, function(data) {
	  $('ul.flickr a').facebox().click(function() {
      $('#facebox p.caption').empty()
      if ($(this).attr('title')) $('#facebox p.caption').html($(this).attr('title'))
    }).hoverText()
    $('#flickr-loading').remove()
    $('#sidebar .body').setHeight()
	});
	
  setTimeout(function() { $('p.notice, p.warning, p.error').fadeOut(1500); }, 15000)
  
  $('a#admin-link').click(function(e) {
    e.preventDefault()
    
    $.get(this.href, function(data) {
      $.facebox(data)
      $('#facebox p.caption').empty()
      $('input#user_username').focus()
    })
  })
});