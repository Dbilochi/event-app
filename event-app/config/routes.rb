Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'
      post 'register', to: 'users#create'
      get 'user/:id/invitations', to: 'events#user_invitations'
      get 'user/:id/events', to: 'events#user_events'
    end
  end
end
