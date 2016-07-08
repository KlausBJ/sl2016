Rails.application.routes.draw do
  resources :assignments
  resources :assignments
  resources :registrations do
		collection do
			post :import
			get :task_eligible
			post :assign
		end
	end
	
  resources :ticket_types do
		collection do
			post :import
		end
	end
	
  resources :tickets
	resources :activities do
		collection do
			post :import
		end
		member do
			post :ticket_import
		end
	end
	
  resources :assignments
  resources :tasks do
		collection do
			post :import
			get :available
			end
	end
		
  resources :members do
		collection do
			post :import
		end
	end

# You can have the root of your site routed with "root"
  root 'members#index'

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
