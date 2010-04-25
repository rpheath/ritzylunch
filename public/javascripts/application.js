$(function() {
  $('a[rel=facebox]').facebox()
  
  $('a[rel=external]').click(function(e) {
    e.preventDefault()
    window.open(this.href)
  })
  
  $('#sidebar .body').setHeight()
  
  $('ul.bikenight').flickrPhotos({ tags: 'rpheath' })
  $('ul.history').flickrPhotos({ tags: 'portfolio' })
	
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