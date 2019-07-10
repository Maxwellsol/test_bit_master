Rails.application.routes.draw do
  resources :items do
      get :update_quality
  end
  root 'items#index'

end
