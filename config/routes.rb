Rails.application.routes.draw do
  get 'hotels/index'

  get 'hotels/show'

  devise_for :users
  root "static_pages#home"
  get "home" => "static_pages#home"
  resources :hotels, only: [:index, :show]
  
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
