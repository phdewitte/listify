Rails.application.routes.draw do
  get '/', to: 'playlists#index'

  resources :playlists
end
