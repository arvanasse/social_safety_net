ActionController::Routing::Routes.draw do |map|
  map.resources :site, :collection => { :list => :get }
  map.root :controller => 'site'
end
