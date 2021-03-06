Cloudauth::Application.routes.draw do

    
  root :to => 'high_voltage/pages#show', :id => 'home'

  get "customizations/refresh"
  get "connector_actions/new"
  get "connector_actions/create"
  get "users/show"
  get "users/dashboard"
  get "cloud_books/success_form"
  
  # ======Users Controller
  match '/signup', to: 'users#new', via: [:get, :post]
  match '/forgot', to: 'users#forgot', via: [:get]
  match '/edit', to: 'users#edit',via: [:get]
  match '/dashboard', to: 'users#dashboard',via: [:get]
  match '/upgrade', to: 'users#upgrade', via: [:post]
  match '/email_verify', to: 'users#email_verify',via: [:post]
  match '/verified_email', to: 'users#verified_email', via: [:get]
  match '/update', to: 'users#update', via: [:get, :post, :patch]
  
  match '/signin', to: 'sessions#new', via: [:get]
  get "signout" => "sessions#destroy", :as => "signout", via: [:post]
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]


#   =======Cloud_books controller
   get '/cloud_book_create' => 'cloud_books#new', via: [:get, :post]   
   match '/new', to: 'cloud_books#new', via: [:get, :post]
   match '/success_form', to: 'cloud_books#success_form', via: [:get, :post]

# 	=======Cloud_identity controller

  match '/federate', to: 'cloud_identities#federate', via: [:get, :post]
  match '/cloud_identities/destroy', to: 'cloud_identities#destroy', via: :delete
  match '/newidentity', to: 'cloud_identities#new_identity', via: [:post]
  get  '/go_identity' => 'cloud_identities#go_identity'

# 	=======Cloud Books History 
  match '/worker', to: 'cloud_books_histories#worker', via: [:get, :post] 

# 	=======Billing controller
  get  '/pricing' => 'billing#pricing'
  get  '/account' => 'billing#account'
  get  '/history' => 'billing#history'

# 	=======apps_items_controller
  match '/apps_items/destroy', to: 'apps_items#destroy', via: :delete

# 	=======Connector_project_controller
#  match '/connector_project/destroy', to: 'connector_projects#destroy'
#  match '/connector_project/create', to: 'connector_projects#create'
#  match '/connector_project/upload', to: 'connector_projects#upload'
#  match '/connector_project/import', to: 'connector_projects#import'
#  match '/connector_execution/export', to: 'connector_executions#export'
#  match '/connector_execution/execute', to: 'connector_executions#execute'


# 	=======Sample pages
  get 'pages/get_started' => 'high_voltage/pages#show', :id => 'get_started'
  get 'pages/features' => 'high_voltage/pages#show', :id => 'features'
  get 'pages/about' => 'high_voltage/pages#show', :id => 'about'
  get 'pages/contribute' => 'high_voltage/pages#show', :id => 'contribute'

  resources :users
  resources :sessions
  resources :identities
  resources :organizations, only: [:create, :destroy]
  resources :cloud_identities
  resources :apps_items
  resources :connector_projects
  resources :connector_actions
  resources :connector_outputs
  resources :connector_executions
  resources :cloud_books_histories
  resources :cloud_books

match '/create_cloud_history', to: 'cloud_books_histories#create_cloud_history', via: [:get, :post] 

resource :posts do
   collection do
     get 'bookselect'
   end
 end
end
