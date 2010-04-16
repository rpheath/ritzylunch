ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  
  map.home '/home', :controller => 'home'
  map.menu '/menu', :controller => 'menu'
  map.about '/about', :controller => 'about'
  map.location '/location', :controller => 'location'
end