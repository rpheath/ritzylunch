ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  
  map.home '/home', :controller => 'home'
  map.menu '/menu', :controller => 'menu'
  map.about '/about', :controller => 'about'
  map.location '/location', :controller => 'location'
  
  map.resources :location, :only => [:index], :collection => { :directions => :any }
  
  map.resources :testimonials, :only => [:index]
  
  map.namespace :admin do |admin|
    admin.resources :base, :only => [:index]
    admin.resources :users
    admin.resources :about, :only => [:edit, :update, :show]
    admin.resources :testimonials
  end
  
  map.resource :session
  map.with_options :controller => 'sessions' do |path|
    path.login  '/login',  :action => 'create'
    path.logout '/logout', :action => 'destroy'
  end
end