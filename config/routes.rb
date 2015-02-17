Rails.application.routes.draw do
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get   '/work_places/new',  to: 'work_places#new'
  post  '/work_places',      to: 'work_places#create'
  get   '/work_places/edit', to: 'work_places#edit'
  patch '/work_places',      to: 'work_places#update'
  put   '/work_places',      to: 'work_places#update'
end
