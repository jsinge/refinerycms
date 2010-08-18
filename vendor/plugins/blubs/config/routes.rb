ActionController::Routing::Routes.draw do |map|
  map.resources :blubs

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :blubs, :collection => {:update_positions => :post}
  end
end
