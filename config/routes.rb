Rails.application.routes.draw do

  resources :comments
  resources :users
  
  root to: "posts#index"
    get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts do
  resources :comments
 	end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
