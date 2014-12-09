Rails.application.routes.draw do

  root 'home#index'
  # devise_for :users
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'new' }

  # get '/' => 'home#index'


  get 'u/:username'                => 'profiles#single', as: 'profile'
  get 'u/:username/delete'         => 'profiles#delete'

  get 't/:trip'                    => 'trips#single', as: 'trip'
  get 'u/:username/new/trip'       => 'trips#create'

  # API


  get 'api/t/:trip/items/:type'    => "api#getItems"
  post 'api/t/:trip/items/:type'   => "api#setItems"
  delete 'api/t/:trip/items/:type' => "api#deleteItems"


  get 'api/t/:trip/budgets/'       => "api#getBudgets"
  post 'api/t/:trip/budgets/'      => "api#setBudgets"
  post 'api/t/:trip/budgets/:id'   => "api#modBudgets"
  delete 'api/t/:trip/budgets/'    => "api#deleteBudgets"

  get 'api/t/:trip/dest'           => "api#getDest"
  post 'api/t/:trip/dest'          => "api#setDest"

  post 'api/:username/newtrip'     => "api#createTrip"
  post 'api/t/:trip/data/'         => "api#setDataTrip"
  post 'api/t/:trip/data/image/'   => "api#setImageTrip"
  delete 'api/t/:trip/data/'       => "api#removeTrip"


  get '/api/t/:trip/editors'       => "api#getAllEditors"
  post '/api/t/:trip/neweditor'    => "api#addEditor"
  post '/api/t/:trip/deleditor'    => "api#removeEditor"
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
