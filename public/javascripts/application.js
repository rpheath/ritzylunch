$(function() {
  $('a[rel=facebox]').facebox()
  
  $('a[rel=external]').click(function(e) {
    e.preventDefault()
    window.open(this.href)
  })

  $('ul.flickr').jflickrfeed({
		limit: 5,
		qstrings: {
			id: '95448703@N00',
			tags: 'rpheath'
		},
		itemTemplate: '<li><a href="{{image}}" title="{{title}}"><img src="{{image_s}}" alt="{{title}}" /></a></li>'
	}, function(data) {
	  $('ul.flickr a').facebox().click(function() {
      $('#facebox p.caption').empty()
      if ($(this).attr('title')) $('#facebox p.caption').html($(this).attr('title'))
    })
	});
});