SociedadeAvalia::Application.routes.draw do

  root 'pages#welcome'

  get 'users/following'
  get 'users/followers'
  get 'profiles/show'
  get "users/:id/turn_to_politician", to: "profiles#turn_to_politician"

  resources :posts
  resources :political_parties

  resources :relationships, only: [:create, :destroy]

  devise_for :users, :controllers => { registrations: 'registrations' }

  scope '/mockups', :constraints => lambda { |e| Rails.env.development? } do
    get '/:action', :controller => 'mockups', :actions => /[^\/]+/
  end

  get 'sobre' => 'pages#about'
  get 'termos' => 'pages#terms_of_use'

  get '/:id', to: 'profiles#show'
  get '/:id/following', to: 'users#following'
  get '/:id/followers', to: 'users#followers'

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
