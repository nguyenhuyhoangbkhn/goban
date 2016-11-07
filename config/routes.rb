Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'hotels/index'

  get 'hotels/show'

  devise_for :users
  root "static_pages#home"
  get "home" => "static_pages#home"
  resources :hotels, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end
  
  namespace :admin do
    root "mains#index"
    resources :provincials
    resources :districs
    resources :villages
    resources :addresses
    resources :hotels
    resources :main, only: :index
  end
end
