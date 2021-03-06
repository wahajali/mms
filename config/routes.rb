Rails.application.routes.draw do

  mount Dashing::Engine, at: Dashing.config.engine_path
  #devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    get 'users/add' => 'users#add', :as => 'new_user_registration'
    post 'users' => 'users#create', as: 'user_registration'
    #put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :bs_or_pl_sub_categories

  get 'business_categories/get_categories' => 'business_categories#get_categories'

  resources :business_categories 

  resources :bs_or_pl_categories

  resources :incomes

  resources :income_types

  resources :income_categories do
    member do
      get 'sub_categories'
    end
  end

  resources :income_sub_categories

  resources :expense_sub_categories

  resources :expense_categories do 
    member do
      get 'sub_categories'
    end
  end

  resources :expense_types

  resources :expenses

  resources :doctors

  resources :diseases do
    member do
      get 'preview'
    end
  end

  resources :stocks, only: [:new, :create]

  resources :medicines do 
    resources :stocks, except: [:new, :create]
    member do
      get 'preview'
    end
  end

  resources :patients do 
    member do 
      get 'add_associated_disease_form'
      get 'add_main_disease_form'
      get 'update_associated_disease_form'
      get 'update_main_disease_form'

      post 'add_associated_disease'
      post 'add_main_disease'
      post 'update_associated_disease'
      post 'update_main_disease'
    end
    resources :patient_records, except: [:index]
    member do 
      patch 'add_legacy_card'
      get 'edit_legacy_card'
    end
  end

  resources :legacy_cards, only: [:destroy]

  resources :manufacturings

  resources :institutes

  resources :tradings

  resources :laboratories

  resources :pharmacies

  resources :trusts

  resources :clinics

  resources :center_types

  resources :corporates

  root "home#home"

  get "about" => "home#about"
  get "contact" => "home#contact"
  get "faq" => "home#faq"
  get "search" => "search#query"
  get "balance_sheet" => "reports#balance_sheet"
  get "pnl" => "reports#pnl"
  get "fetch_report" => "reports#fetch_report"
  get "reports" => "reports#reports"

#  resources :addresses

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
