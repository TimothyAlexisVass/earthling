Rails.application.routes.draw do
  root 'staticpages#reminders'

  get '/coaching', to: 'users#new'

  get '/nutrition', to: 'nutrition#show'

  get '/nutrition/top', to: 'nutrition#top'

  get '/nutrition/food_items_selection', to: 'food_items#food_items_selection'

  get '/test', to: 'food_items#test'

  post '/nutrition/clear_all_selected_food_items', to: 'selected_food_items#clear_all'
  
  get 'contact', to: 'contacts#new'

  resources :users, only: [:new, :create]
  resources :food_items, only: [:new, :create]
  resources :selected_food_items, only: [:create, :destroy, :show]

  resources :contacts, only: [:new, :create]
end
