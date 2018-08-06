Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:new, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#dashboard'

  resources :courses do
    resources :enrollments, only: [:new, :create]
  end

end
