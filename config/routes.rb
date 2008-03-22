ActionController::Routing::Routes.draw do |map|
  map.resources :chapbooks

  map.connect 'users/home', :controller => 'users', :action => 'home' #convert to named route
  map.connect 'users/dashboard', :controller => 'users', :action => 'dashboard' #convert to named route
  map.connect 'poems/about', :controller => 'poems', :action => 'about' #convert to named route
  map.connect 'poems/compare/:poem_id/:revision_id', :controller => 'poems', :action => 'compare' #convert to named route
  
  map.resources :tags

  map.resources :comments

  map.resources :poems

  map.resources :users
  
  map.root :controller => "account", :action => "login"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
