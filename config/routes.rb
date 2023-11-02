Rails.application.routes.draw do
  resources :store_room_exits do
    collection do
      get 'entry', to: 'store_room_exits#entry'
      post 'entry', to: 'store_room_exits#entry_point'
    end
  end
  resources :receive_donation_requests
  resources :store_room_entries
  resources :donation_requests do
    collection do
      get 'entry', to: 'donation_requests#entry'
      post 'entry', to: 'donation_requests#entry_point'
    end
    member do
      get 'accepted_paper', to: 'donation_requests#accepted_paper'
      get 'thankyou', to: 'donation_requests#thankyou'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
