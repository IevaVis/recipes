Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :cocktails

  get "/search" => "search#index"
	get  "/sign_up" => "users#new", as: "sign_up"
	post "/users" => "users#create"
  get "/sign_in" => "sessions#new", as: "sign_in"
	post "sign_in" => "sessions#create"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root 'welcome#index'
 

end

