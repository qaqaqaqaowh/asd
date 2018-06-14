Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "sessions#new"

  resources :users
  resources :listings

  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  get "/signup" => "users#new", as: "sign_up"
  post "/signup" => "users#create"
end

# resource: book || session || listing || user
# 7 restful routes

# new => a form to a new resource

# create => sending information from new form to create 
# resource

# index => show all the resource

# show => show one particular resource

# edit => to show a form to edit a resource

# update => sending information from edit form to edit 
# resource

# delete => to delete a resource