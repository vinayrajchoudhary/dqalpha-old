Blog::Application.routes.draw do 

 

    #get "pages/home"
  match '' => 'pages#home'
    #get "pages/search"
  match '/search' => 'pages#search'
#get "users/new"
  match 'users/:id/quests/:id' => 'quests#show', :via => [:get, :post]
  resources :users do
    resources :quests
  
  end
    resources :quests do
      resources :qs
    end
   resources :qs do
      resources :qmails
    end
  resources :user_sessions, :only => [ :create]
  match 'signin' => 'user_sessions#new', :as => :signin
  match 'signout' => 'user_sessions#destroy', :as => :signout
  match '/signup' => 'users#new'  
#get "pages/about"
    match '/about' => 'pages#about'

   mailboxes_for :users
    # get "pages/contact"
    match '/contact' => 'pages#contact'
 
  resources :microposts
  resources :involvements
  resources :lifespans 
  resources :posts
 
    # get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
    #root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end