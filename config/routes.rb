ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  
  map.home '/home', :controller => 'home'
  map.menu '/menu', :controller => 'menu'
  map.about '/about', :controller => 'about'
  map.location '/location', :controller => 'location'
  map.press '/press', :controller => 'press'
  
  map.resources :location, :only => [:index], :collection => { :directions => :any }
  map.resources :testimonials, :only => [:index]
  map.resources :announcements, :only => [:index, :show]
  map.resources :subscribers, :only => [:create]
  
  map.namespace :admin do |admin|
    admin.resources :base, :only => [:index]
    admin.resources :users
    admin.resources :about, :only => [:edit, :update, :show]
    admin.resources :testimonials
    admin.resources :links
    admin.resources :menu_categories, :as => 'menu/categories',
      :collection => { :sortable => :get, :reorder => :post }
    admin.resources :menu_items, :as => 'menu/items',
      :collection => { :sortable => :get, :reorder => :post }
    admin.resources :announcements
    admin.resources :subscribers
    admin.resources :emails
  end
  
  map.resource :session
  map.with_options :controller => 'sessions' do |path|
    path.login  '/login',  :action => 'create'
    path.logout '/logout', :action => 'destroy'
  end
end