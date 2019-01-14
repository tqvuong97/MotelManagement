Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/king', as: 'rails_admin'
  resources :billings
  resources :services_rooms
  resources :services
  get "/newservices" ,to: "services#createservice"
  get "/newrooms" ,to: "rooms#createmanyrooms"
  # get "/export" ,to: "billings#exp"
  get "/guestinfo",to: "static_pages#guestinfo"

  resources :guests
  resources :devices_rooms
  get "/chart" , to: "rooms#createchart"
  resources :devices
  resources :rooms do
    resources :devices_rooms

  end
  resources :backup_guests,only: :index
  resources :rooms do
    resources :services_rooms do
      resources :billings do
        patch "/payment",to: "billings#updatepayment"
        put "/return",to: "billings#returnroom"
      end
    end
  end
  resources :rooms do
    resources :guests
  end
  resources :areas
  devise_for :admins #, controllers: {sessions: "sessions"}
  get "/static_pages/:page", to: "static_pages#show"
  root "static_pages#show", page: "home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
