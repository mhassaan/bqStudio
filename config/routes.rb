Rails.application.routes.draw do
  devise_for :admins,controllers: { sessions: "admins/sessions"}
  devise_scope :admin do
    get "admins/sign_out" => "devise/sessions#destroy"
  end

  namespace :admin do
    root 'welcome#index'
    resources :artist do 
      collection do 
        get 'new_work_to_artist/:id'=> 'artist#new_work_to_artist'
        get 'show_work_of_artist/:id'=> 'artist#show_work_of_artist'
        post 'add_work_to_artist'=> 'artist#add_work_to_artist'
        get 'edit_work_of_artist/:id'=> 'artist#edit_work_of_artist'
        post 'update_work_of_artist'=> 'artist#update_work_of_artist'
        delete 'delete_work_of_artist/:id' => 'artist#delete_work_of_artist'
      end
    end
    resources :workshop do 
      collection do
        get 'new_work_to_workshop/:id'=> 'workshop#new_work_to_workshop'
        get 'show_work_of_workshop/:id'=> 'workshop#show_work_of_workshop'
        post 'add_work_to_workshop'=> 'workshop#add_work_to_workshop'
        get 'edit_work_of_workshop/:id'=> 'workshop#edit_work_of_workshop'
        post 'update_work_of_workshop'=> 'workshop#update_work_of_workshop'
        delete 'delete_work_of_workshop/:id' => 'workshop#delete_work_of_workshop'
      end
    end
    resources :visit do
      collection do
        get 'new_work_to_visit/:id'=> 'visit#new_work_to_visit'
        get 'show_work_of_visit/:id'=> 'visit#show_work_of_visit'
        post 'add_work_to_visit'=> 'visit#add_work_to_visit'
        get 'edit_work_of_visit/:id'=> 'visit#edit_work_of_visit'
        post 'update_work_of_visit'=> 'visit#update_work_of_visit'
        delete 'delete_work_of_visit/:id' => 'visit#delete_work_of_visit'
      end
    end
    resources :newsletter do
      collection do
        get 'new_images_to_newsletter/:id'=> 'newsletter#new_images_to_newsletter'
        get 'show_images_of_newsletter/:id'=> 'newsletter#show_images_of_newsletter'
        post 'add_images_to_newsletter'=> 'newsletter#add_images_to_newsletter'
        get 'edit_images_of_newsletter/:id'=> 'newsletter#edit_images_of_newsletter'
        post 'update_images_of_newsletter'=> 'newsletter#update_images_of_newsletter'
        delete 'delete_images_of_newsletter/:id' => 'newsletter#delete_images_of_newsletter'

        get 'new_articles_to_newsletter/:id'=> 'newsletter#new_articles_to_newsletter'
        get 'show_articles_of_newsletter/:id'=> 'newsletter#show_articles_of_newsletter'
        post 'add_articles_to_newsletter'=> 'newsletter#add_articles_to_newsletter'
        get 'edit_articles_of_newsletter/:id'=> 'newsletter#edit_articles_of_newsletter'
        #post 'update_article' =>'newsletter#update_article'
        post 'update_articles_of_newsletter'=> 'newsletter#update_articles_of_newsletter'
        delete 'delete_articles_of_newsletter/:id' => 'newsletter#delete_articles_of_newsletter'
      end
    end

  end
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
