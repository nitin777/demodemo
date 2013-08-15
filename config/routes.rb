Ocms::Application.routes.draw do

  resources :fronts

  resources :users
  resources :user_sessions
  resources :static_pages
  resources :countries
  resources :cemeteries
  
  resources :areas
  resources :bookings
  resources :catalogs
  resources :chapels
  resources :coffins
  resources :denominations
  resources :diseases
  resources :grantees
  resources :grantee_graves
  resources :graves
  resources :grave_statuses
  
  resources :identities
  resources :payment_statuses
  resources :plots
  resources :rooms
  resources :rows
  resources :sections
  resources :service_types
  resources :stone_masons
  resources :stone_mason_work_types
  resources :unit_types
  
  
  get 'logout' => 'user_sessions#destroy', :as => :logout
  get 'login' => 'user_sessions#new', :as => :login
  
  get 'dashboard' => 'fronts#dashboard', :as => :dashboard
  get '/other/:page_id' => 'fronts#other', :as => :other
  get '/get_section_from_area' => 'fronts#get_section_from_area', :as => :get_section_from_area
  get '/get_section_row_from_area' => 'fronts#get_section_row_from_area', :as => :get_section_row_from_area  
  get '/get_row_from_section' => 'fronts#get_row_from_section', :as => :get_row_from_section
  get '/get_section_row_plot_from_area' => 'fronts#get_section_row_plot_from_area', :as => :get_section_row_plot_from_area
  get '/get_row_plot_from_section' => 'fronts#get_row_plot_from_section', :as => :get_row_plot_from_section
  get '/get_plot_from_row' => 'fronts#get_plot_from_row', :as => :get_plot_from_row
  
  
  

  
  match '/forgot_password' => 'fronts#forgot_password', :as => :forgot_password, via: [:get, :post]
  match '/change_password' => 'fronts#change_password', :as => :change_password, via: [:get, :post, :patch]
    
  get '/show_search_box/:toggle/:model/:pm' => 'fronts#show_search_box', :as => :show_search_box
  get '/search/:toggle' => 'users#search', :as => :search
  
  root 'user_sessions#new'    
    
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
