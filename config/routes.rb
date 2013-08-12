Hb::Application.routes.draw do
  root to: 'homes#show', via: :get

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  get 'music', to: 'campaigns#index', as: :music
end
