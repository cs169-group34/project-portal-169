Rails.application.routes.draw do

  get 'comments/index'

  get "logout" => "logout#index"

  get "login" => "login#index"
  post "login" => "login#login"
  
  get "comments" => "comments#index"

  resources :projects
  resources :instructors
  resources :student_teams
  
  root 'welcome#index'
  
  get "/student_teams/:id/submit_story/" => "student_teams#new_story"
  post "/student_teams/:id/submit_story/" => "student_teams#create_story"
  post "/student_teams/:id/assign/" => "student_teams#assign"
  post "/student_teams/:id/add_gsi_comments/:iter_id/" => "student_teams#add_gsi_comments"
  post "/projects/:id/assign/" => "projects#assign"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
