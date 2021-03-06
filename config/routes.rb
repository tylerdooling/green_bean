GreenBean::Application.routes.draw do


  resources :scheduled_meals do
    collection do
      get "select_meal" => "scheduled_meals#select_meal"
      get 'shopping_list' => 'scheduled_meals#shopping_list'
    end
  end

  resources :meals do 
    collection do 
    end

    member do
      post 'add_recipe' => "meals#add_recipe"
      get 'select_recipe'
    end

    resources :recipes do
    end
  end

  resources :recipes do
    collection do
      get 'filter' => "recipes#filter"
    end

    member do
      get 'add_ingredient' => 'recipes#add_ingredient'
    end

    get 'recipe_ingredients/:recipe_ingredient_id/edit', :action => :edit_recipe_ingredient, :as => :edit_recipe_ingredient
    put 'recipe_ingredients/:recipe_ingredient_id', :action => :update_recipe_ingredient, :as => :update_recipe_ingredient
  end

  resources :ingredients do
    collection do
      get 'filter' => "ingredients#filter"
    end

  end

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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
