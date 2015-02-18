Rails.application.routes.draw do
  root 'home#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  get   '/work_places/new',  to: 'work_places#new'
  get   '/work_places/edit', to: 'work_places#edit'
  post  '/work_places',      to: 'work_places#create'
  patch '/work_places',      to: 'work_places#update'
  put   '/work_places',      to: 'work_places#update'

  get   '/slack/new',  to: 'slack_notifications#new'
  get   '/slack/edit', to: 'slack_notifications#edit'
  post  '/slack',      to: 'slack_notifications#create'
  patch '/slack',      to: 'slack_notifications#update'
  put   '/slack',      to: 'slack_notifications#update'

  post '/send_message/slack', to: 'messengers#slack'
end
