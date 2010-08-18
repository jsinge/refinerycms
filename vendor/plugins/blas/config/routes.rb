ActionController::Routing::Routes.draw do |map|
  map.resources :blas

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :blas, :collection => {:update_positions => :post}
  end
end
