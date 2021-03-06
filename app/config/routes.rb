Rails.application.routes.draw do
  root to: 'home#intro'

  get 'home/listener' => 'home#listener'
  get 'home/musician' => 'home#musician'

  # resources :performers
  post 'performers/lookup' => 'performers#lookup'
  get 'performers/search' => 'performers#search'
  get 'performers/show' => 'performers#show'
  get 'performers' => 'performers#index'

  get 'performers/edit' => 'performers#show'
  get 'performers/new' => 'performers#new'

  get 'performers/delete' => "performers#delete"
  post 'performers' => 'performers#create'

  resources :sessions
  post 'sessions/new', to: 'sessions#create'
  get 'log_out' => 'sessions#destroy', :as => "log_out"


  # post 'twilio/receive' => 'twilio#receive'

  # resource :sms, only: :create

  post '/sms' => 'sms#create'
  get '/sms' => 'sms#create'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
