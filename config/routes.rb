Rails.application.routes.draw do
  resources :posts
  resources :comments
  devise_for :users
  root :to => "welcome#index"
  get 'my_posts', :to => 'posts#show_my_posts'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
