Rails.application.routes.draw do
  root 'staticpages#reminders'

  get '/coaching', to: 'users#new'

  get '/nutrition', to: 'nutrition#show'

  get '/nutrition/food_items_selection', to: 'food_items#food_items_selection'

  get '/test', to: 'food_items#test'

  resources :users, only: [:new, :create]
  resources :food_items, only: [:new, :create]
  resources :selected_food_items, only: [:create]
end
