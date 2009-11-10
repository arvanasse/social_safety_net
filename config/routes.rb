ActionController::Routing::Routes.draw do |map|
  map.resources :site, :collection => { :list => :get, :dashboard => :get }
  map.root :controller => 'site'
end
