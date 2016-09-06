Rails.application.routes.draw do
  namespace :admin do
    resources :sports_day_subscriptions do
      member do
        get 'export'
        get 'confirm'
      end
    end
    resources :sport_module_subscriptions do
      member do
        get 'export'
        get 'confirm'
      end
    end
    resources :swim_lesson_subscriptions do
      member do
        get 'export'
        get 'confirm'
      end
    end

    resources :sports_training_subscriptions do
      member do
        get 'export'
        get 'confirm'
      end
    end
    resources :sports_trainings

    root 'dashboard#index'

    resources :sport_modules
    resources :swim_lessons
    resources :sports_days
    resources :activities
    resources :places
    resources :coaches do
      member do
        get 'export'
      end
    end
    resources :levels
    get 'subscription/update_activities', to: 'sports_training_subscriptions#update_activities'
  end

  #devise_for :users, path: 'admin', controller: AdminController

  namespace :public do
    get 'contact', to: 'contact#index'
    post 'contact/send', to: 'contact#create'
    get 'photos', to: 'photo#index'
    get 'refund', to: 'refund#index'
    get 'registration', to: 'registration#index'
    post 'registration/confirm', to: 'registration#confirm'
    root 'welcome#index'
    get 'registration/update_sports_training_places', to: 'registration#update_sports_training_places'
    get 'registration/update_swim_lesson_places', to: 'registration#update_swim_lesson_places'
    get 'registration/update_sport_module_places', to: 'registration#update_sport_module_places'
    get 'registration/update_sports_day_places', to: 'registration#update_sports_day_places'
    get 'registration/update_sports_training_choices', to: 'registration#update_sports_training_choices'
    get 'registration/update_sports_training_activities', to: 'registration#update_sports_training_activities'
    get 'registration/update_swim_lesson_levels', to: 'registration#update_swim_lesson_levels'
    get 'registration/update_swim_lesson_choices', to: 'registration#update_swim_lesson_choices'
    get 'registration/update_sport_module_choices', to: 'registration#update_sport_module_choices'
    get 'registration/update_sports_day_choices', to: 'registration#update_sports_day_choices'
  end

  get 'birthday_iframe', to: 'iframe#show_birthday_iframe'
  get 'swimming_iframe', to: 'iframe#show_swimming_iframe'
  get 'swimming_children_iframe', to: 'iframe#show_swimming_children_iframe'
  get 'school_iframe', to: 'iframe#show_school_iframe'
  get 'sports_training_iframe', to: 'iframe#show_sports_training_iframe'
  get 'sport_module_iframe', to: 'iframe#show_sport_module_iframe'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root to: 'home#index'

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
