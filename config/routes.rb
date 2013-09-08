Hb::Application.routes.draw do
  root to: 'homes#show', via: :get

  devise_for :users,
    controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    get "users/sign_out", to: 'devise/sessions#destroy', as: :sign_out
  end

  resources :campaigns, only: [:index, :show, :new, :create, :destroy] do
    resources :reservations, only: [:create]
  end
  get 'music', to: 'campaigns#index', as: :music

  resource :launchbase, only: [:show]
  resource :artist_lounge, only: [:show]
  resource :user_settings, only: [:show]
  resources :musicians, only: [:show]

  get 'soundcloud/connect', to: 'soundcloud_connection#connect',
    as: :soundcloud_connect
  get 'soundcloud/connected', to: 'soundcloud_connection#connected',
    as: :soundcloud_connected
  delete 'soundcloud/disconnect', to: 'soundcloud_connection#disconnect',
    as: :disconnect_soundcloud

  get 'pages/home' => 'high_voltage/pages#about', id: 'about'
  get 'pages/home' => 'high_voltage/pages#privacy', id: 'privacy'
  get 'pages/home' => 'high_voltage/pages#fans', id: 'fans'
  get 'pages/home' => 'high_voltage/pages#musicians', id: 'musicians'

  get '/delayed_job', to: DelayedJobWeb, anchor: false
end
