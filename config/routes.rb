Rails.application.routes.draw do
  root 'staticpages#reminders'

  get '/coaching', to: 'users#new'

  get '/nutrition', to: 'nutrition#show'

  resources :users, only: [:new, :create]
  resources :food_items, only: [:new, :create]
  resources :selected_food_items
end
