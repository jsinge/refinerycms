Refinery::Application.routes.draw do
  resources :categories

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :categories do
      collection do
        post :update_positions
      end
    end
  end
end
