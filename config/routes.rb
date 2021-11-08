Rails.application.routes.draw do
  devise_for :users

 root to: 'homes#top'
 root to: 'homes#about'
 resources :bars, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  resources :comments, only: [:create, :destroy]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
