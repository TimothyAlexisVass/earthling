Rails.application.routes.draw do
  root 'staticpages#reminders'

  get '/coaching', to: 'users#new'

  resources :users, only: [:new, :create, :index]
end
