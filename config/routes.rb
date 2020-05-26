Rails.application.routes.draw do
  root "home#index"

  devise_for :users, path: 'user', path_names: {sign_in: 'login', sign_out: 'logout'}
  resources :posts, controller: "home" do
    resources :comments, only: [:create, :destroy]
  end
  # get 'home/index'
  
  # get 'home/new'
  # # get 'home/new' => 'home#new'
  
  # post 'home/create', as: 'posts'

  # get 'home/destroy/:post_id', to: 'home#destroy', as: 'post_destroy'

  # get 'home/edit/:post_id' => 'home#edit', as: 'post_edit'

  # patch 'home/update/:post_id' => 'home#update', as: 'post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end