SociedadeAvalia::Application.routes.draw do

  get 'politician_likes/like'

  get 'politician_likes/dislike'

  get 'political_party_likes/like'

  get 'political_party_likes/dislike'

  get 'post_likes/like'
  get 'post_likes/dislike'

  root 'pages#ranking'

  get 'users/following'
  get 'users/followers'
  get 'users/home'
  get 'users/search'
  get 'home', to: 'users#home'
  get 'profiles/show'
  get "users/:id/turn_to_politician", to: "profiles#turn_to_politician"
  get "users/:id/turn_to_elector", to: "profiles#turn_to_elector"

  resources :posts
  resources :political_parties, path: 'partidos'

  resources :relationships, only: [:create, :destroy]

  devise_for :users, controllers: { registrations: 'registrations' }
  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  scope '/mockups', :constraints => lambda { |e| Rails.env.development? } do
    get '/:action', :controller => 'mockups', :actions => /[^\/]+/
  end

  get 'sobre' => 'pages#about'
  get 'termos' => 'pages#terms_of_use'

  get '/:id', to: 'profiles#show'
  get '/:id/following', to: 'users#following'
  get '/:id/followers', to: 'users#followers'
  
end
