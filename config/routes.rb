Ordermeal::Application.routes.draw do
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
  namespace :api do
    resources :users do
      resources :foods
    end
    get 'foods', to: 'foods#index_all'
    post 'file-upload', to: 'files#create'
  end

  get 'login', to: 'web_ui#login'
  post 'login', to: 'web_ui#sessions'
  delete 'logout', to: 'web_ui#logout', as: :logout

  get 'admin', to: 'web_ui#admin'
  get 'admin/all', to: 'web_ui#admin_all'
  get 'admin/new', to: 'web_ui#admin_new'
  get 'admin/edit', to: 'web_ui#admin_edit'
  get 'admin/food', to: 'web_ui#food_index'

  root 'web_ui#index'

end
