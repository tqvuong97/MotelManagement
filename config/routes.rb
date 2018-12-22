Rails.application.routes.draw do
  resources :guests
  resources :devices_rooms

  resources :devices
  resources :rooms do
    resources :devices_rooms
  end
  resources :rooms do
    resources :guests
  end
  resources :areas
  devise_for :admins
  get "/static_pages/:page", to: "static_pages#show"
  root "static_pages#show", page: "home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
