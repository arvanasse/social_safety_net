ActionController::Routing::Routes.draw do |map|
  map.resource  :session, :only => [ :new, :create, :destroy ]

  map.resources :people do |person|
    person.resources :managed_cases
  end

  map.resources :managed_cases

  map.resources :agencies

  map.resources :site, :collection => { :list => :get, :dashboard => :get, :cases=>:get }
  
  map.login  'login',  :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => 'site'
end
