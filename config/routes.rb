Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root to: 'homes#top'
  resources :books
  # resources =
  # get "books#index"とか
  # post "books#create"とか　を、まとめて書いてくれてるやつ。




end
