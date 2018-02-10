Rails.application.routes.draw do

  resources :shop_attachments
  get 'clubs/index', as: :clubs
  post 'clubs/talk' => 'clubs#talk'
  get 'clubs/update/:id' => 'clubs#update'
  get 'clubs/page' => 'clubs#page', as: :club_page

  get 'shops/city' => 'shops#region'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :shops do
    collection do
      get '/page' => 'shops#page', as: :shop_page
    end

    member do
      post 'review'
    end
  end

  resources :escapes do
    collection do
      get 'page' => 'escapes#page', as: :escape_page

      post '/:escape_id/comments' => 'escapes#create_comment', as: :create_comment_to
      delete '/:escape_id/comments/:comment_id' => 'escapes#delete_comment', as: :delete_comment_to
      patch '/:escape_id/comments/:comment_id' => 'escapes#update_comment', as: :update_comment_to

      get '/:escape_id/join' => 'escapes#join_escape'
    end
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    # sessions: 'users/sessions'
    registrations: 'users/registrations'
 }

  root 'home#index'

  get 'home/index'

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
