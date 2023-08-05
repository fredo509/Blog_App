Rails.application.routes.draw do
  
  root 'users#index'
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create]
    end 
  end    

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end
end
