ActionController::Routing::Routes.draw do |map|
  map.resources :books

  map.resources :authors
  
  map.root :controller => "books"
end
