ActionController::Routing::Routes.draw do |map|
  map.resources :products

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :products, :collection => {:update_positions => :post}
  end
end
