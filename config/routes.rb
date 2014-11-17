Rails.application.routes.draw do

  resources :bs_or_pl_sub_categories

  get 'business_categories/get_categories' => 'business_categories#get_categories'

  resources :business_categories 

  resources :bs_or_pl_categories

  resources :incomes

  resources :income_types

  resources :income_categories

  resources :income_sub_categories

  resources :expense_sub_categories

  resources :expense_categories

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
    resources :patient_records, except: [:index]
  end

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
