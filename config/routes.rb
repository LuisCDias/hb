Hb::Application.routes.draw do
  root to: 'homes#show', via: :get

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :campaigns, only: [:index, :show] do
    resources :reservations, only: [:create]
  end
  get 'music', to: 'campaigns#index', as: :music

  resource :launchbase, only: [:show]
  resource :artist_lounge, only: [:show]
  resource :user_settings, only: [:show]
end
