ActionController::Routing::Routes.draw do |map|
  map.resources :site, :collection => { :list => :get, :dashboard => :get, :cases=>:get }
  map.root :controller => 'site'
end
