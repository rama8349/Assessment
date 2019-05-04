Rails.application.routes.draw do
  root :to => "locations#index"
  
  resources :locations, except: :show do
  	get :export, on: :collection
  	# get :show, param: :hash_id

  end
  resources :locations, only: :show, param: :hash_id

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
