Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 get 'home/about' => 'homes#about'

 resources :bars, only: [:new, :create, :index, :show, :destroy, :edit, :update] do

  resource :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]

  resources :relationships, only: [:create, :destroy]
  get 'followings/:id' => 'relationships#followings', as: 'followings'
  get 'followers/:id' => 'relationships#followers', as: 'followers'

end
