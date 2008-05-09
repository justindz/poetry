ActionController::Routing::Routes.draw do |map|
  map.home 'users/home', :controller => 'users', :action => 'home'
  map.favorites 'users/favorites/:id', :controller => 'users', :action => 'favorites'
  map.formatted_favorites 'users/favorites/:id.:format', :controller => 'users', :action => 'favorites'
  map.about 'about', :controller => 'poems', :action => 'about'
  map.compare 'poems/compare/:poem_id/:revision_id', :controller => 'poems', :action => 'compare'
  map.organize 'chapbooks/organize', :controller => 'chapbooks', :action => 'organize'
  map.add_to_chapbook 'poems/add_to_chapbook/:poem_id/:chapbook_id', :controller => 'poems', :action => 'add_to_chapbook'
  map.toc 'chapbooks/toc/:id', :controller => 'chapbooks', :action => 'toc'
  map.intro 'chapbooks/intro/:id', :controller => 'chapbooks', :action => 'intro'
  map.page 'chapbooks/:chapbook_id/page/:sequence', :controller => 'chapbooks', :action => 'page'
  map.search 'search/:terms/:page', :controller => 'poems', :action => 'search', :defaults => { :page => '1' }
  map.formatted_search 'search/:terms.:format', :controller => 'poems', :action => 'search'
  map.open_id_complete 'accounts/login', :controller => "accounts", :action => "login", :requirements => { :method => :get }
  
  map.resources :chapbooks
  map.resources :tags
  map.resources :comments
  map.resources :poems
  map.resources :users
  
  map.foaf 'users/show/:id.:format', :controller => 'users', :action => 'show'
  map.formatted_revisions 'poems/revisions/:id.:format', :controller => 'poems', :action => 'revisions'
  
  map.root :controller => "account", :action => "login"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
