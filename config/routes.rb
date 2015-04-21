Rails.application.routes.draw do

  resources :contacts

  resource :cart, only: [:show] do
    post 'add/:product_id', to: 'carts#add', as: :add_to
    get 'remove/:product_id', to: 'carts#remove', as: :remove_from
    post 'remove/:product_id', to: 'carts#remove', as: :_remove_from
    get 'order', to: 'carts#create_order', as: :create_order
    get 'updateqty/:product_id', to: 'carts#updateqty', as: :update_qty
  end

  get  'cart/checkout' => 'carts#checkout', as: :checkout
  get  'cart/payment' => 'carts#payment', as: :payment 

  post  'cart/checkout' => 'carts#checkout', as: :checkout1
  post  'cart/payment' => 'carts#payment', as: :payment1 

  resources :abouts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'products#index'

  get  'products/women' => 'products#women', as: 'women_product' # Show a member of products (id)
  get  'products/men' => 'products#men', as: 'men_product'
  get  'products/kids' => 'products#kids', as: 'kids_product'
  get  'products/onsale' => 'products#onsale', as: 'onsale'
  get  'products/recent' => 'products#recent', as: 'recent_added'


  resources :products

  resources :payment_details

  resources :addresses

  resources :provinces

  resources :customers

  resources :orders

  resources :items

  resources :categories

  get 'search_results' => 'products#search_results', as: 'search_results'

  get 'search_results_women' => 'products#search_results_women', as: 'search_results_women'

  get 'search_results_men' => 'products#search_results_men', as: 'search_results_men'

  get 'search_results_kids' => 'products#search_results_kids', as: 'search_results_kids'  
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
