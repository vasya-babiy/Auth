Auth::Application.routes.draw do

resources :sessions
resources :users do
	resource :profile, except: [ :new, :create ]
end

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
root :to => "users#new"
end
