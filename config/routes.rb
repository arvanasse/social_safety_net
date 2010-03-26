ActionController::Routing::Routes.draw do |map|
  map.resource  :session, :only => [ :new, :create, :destroy ]
  map.resources :people

  map.resources :site, :collection => { :list => :get, :dashboard => :get, :cases=>:get }
  
  map.login  'login',  :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => 'site'
end
