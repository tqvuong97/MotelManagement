Rails.application.routes.draw do
  resources :users
  resources :billings
  resources :services_rooms
  resources :services
  get "/newservices" ,to: "services#createservice"
  get "/newrooms" ,to: "rooms#createmanyrooms"
  get "/export" ,to: "billings#exp"
  get "/guestinfo",to: "static_pages#guestinfo"
  resources :guests
  resources :devices_rooms

  resources :devices
  resources :rooms do
    resources :devices_rooms
  end
  resources :rooms do
    resources :services_rooms do
      resources :billings
    end
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
