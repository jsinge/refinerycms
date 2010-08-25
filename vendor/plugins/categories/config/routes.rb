ActionController::Routing::Routes.draw do |map|
  map.resources :categories

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :categories, :collection => {:update_positions => :post}
  end
end
