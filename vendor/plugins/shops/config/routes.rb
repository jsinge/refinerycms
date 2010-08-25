ActionController::Routing::Routes.draw do |map|

  map.resources :shops, :has_many => [:products, :categories]

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :shops, :collection => {:update_positions => :post}
  end
end
