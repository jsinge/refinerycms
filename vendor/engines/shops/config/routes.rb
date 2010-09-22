Refinery::Application.routes.draw do
  resources :shops

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :shops do
      collection do
        post :update_positions
      end
    end
  end
end
