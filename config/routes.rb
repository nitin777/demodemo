Ocms::Application.routes.draw do

  resources :fronts

  resources :users
  resources :role_permissions
  resources :user_sessions
  resources :static_pages
  resources :countries
  resources :cemeteries
  
  resources :categories

  resources :work_types
  resources :delegation_departments
  
  resources :areas

  resources :catalogs
  resources :chapels
  resources :coffins
  resources :denominations
  resources :diseases
  resources :grantees
  
  resources :graves
  resources :grave_histories
  resources :grave_statuses
  resources :monuments
  resources :letters
  resources :letter_variables
  resources :facilities
  
  resources :identities
  resources :payment_statuses
  resources :plots
  resources :rooms
  resources :rows
  resources :sections
  resources :service_types
  resources :stone_mason_work_types
  resources :unit_types
  resources :maintenance_companies
  
  resources :grantee_graves do
    resources :payments
  end
  
  resources :bookings do
    resources :payments
  end
    
  resources :maintenances do
    resources :payments
  end
  
  resources :permits do
    resources :payments
  end
  
  resources :work_orders do
    resources :payments
  end
    
  get '/get_catalogs_from_category' => 'payments#get_catalogs_from_category', :as => :get_catalogs_from_category
  get '/get_cost_price_from_catalog' => 'payments#get_cost_price_from_catalog', :as => :get_cost_price_from_catalog
  get '/get_amount_from_price' => 'payments#get_amount_from_price', :as => :get_amount_from_price
  get '/get_total_amount_from_quantity' => 'payments#get_total_amount_from_quantity', :as => :get_total_amount_from_quantity
  
  
  
    
  resources :permit_charges
  resources :charges
  
  resources :folders
  resources :document_shares
  
  get '/sub_folders/:parent_folder_id' => 'folders#sub_folders', :as => :sub_folders
  get '/shared_documents_with_you' => 'folders#shared_documents_with_you', :as => :shared_documents_with_you
  
  
  get 'logout' => 'user_sessions#destroy', :as => :logout
  get 'login' => 'user_sessions#new', :as => :login
  
  match 'dashboard' => 'fronts#dashboard', :as => :dashboard, via: [:get, :post]
  get '/other/:page_id' => 'fronts#other', :as => :other
  get '/cemetery/show/:id' => 'fronts#show_cem', :as => :show_cem
  get '/interment_search' => 'fronts#interment_search', :as => :interment_search
  
  get '/interment_details/:id' => 'fronts#interment_details', :as => :interment_details
  get '/interment_grave_details/:id' => 'fronts#interment_grave_details', :as => :interment_grave_details
  get '/interment_grantee_details/:id' => 'fronts#interment_grantee_details', :as => :interment_grantee_details
  
  get '/get_section_from_area' => 'fronts#get_section_from_area', :as => :get_section_from_area
  get '/get_section_row_from_area' => 'fronts#get_section_row_from_area', :as => :get_section_row_from_area  
  get '/get_row_from_section' => 'fronts#get_row_from_section', :as => :get_row_from_section
  get '/get_section_row_plot_from_area' => 'fronts#get_section_row_plot_from_area', :as => :get_section_row_plot_from_area
  get '/get_row_plot_from_section' => 'fronts#get_row_plot_from_section', :as => :get_row_plot_from_section
  get '/get_plot_from_row' => 'fronts#get_plot_from_row', :as => :get_plot_from_row
  get '/get_cemetery_from_country' => 'fronts#get_cemetery_from_country', :as => :get_cemetery_from_country
  
  get '/set_permission/:id/:access' => 'role_permissions#set_permission', :as => :set_permission
  
  get '/get_section_row_plot_grave_from_area' => 'fronts#get_section_row_plot_grave_from_area', :as => :get_section_row_plot_grave_from_area
  get '/get_row_plot_grave_from_section' => 'fronts#get_row_plot_grave_from_section', :as => :get_row_plot_grave_from_section
  get '/get_plot_grave_from_row' => 'fronts#get_plot_grave_from_row', :as => :get_plot_grave_from_row
  get '/get_grave_from_plot' => 'fronts#get_grave_from_plot', :as => :get_grave_from_plot
  get '/get_grantee_from_grave' => 'fronts#get_grantee_from_grave', :as => :get_grantee_from_grave
  get '/get_grantee_booking_from_grave' => 'fronts#get_grantee_booking_from_grave', :as => :get_grantee_booking_from_grave
  
  get '/get_booking_from_grave' => 'fronts#get_booking_from_grave', :as => :get_booking_from_grave
  
  match '/forgot_password' => 'fronts#forgot_password', :as => :forgot_password, via: [:get, :post]
  match '/change_password' => 'fronts#change_password', :as => :change_password, via: [:get, :post, :patch]
  match '/profile' => 'fronts#profile', :as => :profile, via: [:get, :post, :patch]
    
  get '/show_search_box/:toggle/:model/:pm' => 'fronts#show_search_box', :as => :show_search_box
  get '/grave_search_box/:toggle/:model/:pm' => 'fronts#grave_search_box', :as => :grave_search_box
  get '/booking_search_box/:toggle/:model/:pm' => 'fronts#booking_search_box', :as => :booking_search_box
  
  get '/search/:toggle' => 'users#search', :as => :search
  
  
  get 'print_letter/:letter_id/:booking_id' => 'bookings#print_letter', :as => :print_letter
  
  get '/OCMS/:name' => 'folders#download', :as => :download
  
  root 'fronts#index'    
    
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
