Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #main page
  get "/", to: "pages#main", as:"root"
  #----------------------------------Employees----------------------------------
  #Show all employees
  get "/employees", to: "employees#index", as: "employees"
  #create employee
  get "/employees/new", to: "employees#new", as: "new_employee"
  #show employee
  get "/employees/:id", to: "employees#show", as: "employee"
  #create employee
  post "/employees", to: "employees#create", as: "create_employee"
  #delete employee
  delete "/employees/:id", to: "employees#destroy", as: "delete_employee"

  #update employee
  get "/employees/:id/edit",to: "employees#edit", as: "edit_employee"
  patch "/employees/:id",to: "employees#update", as: "update_employee"
  
  patch "/employees/:id/setcard", to: "employees#setcard", as: "setcard"
  #-----------------------------------reports------------------------------------
  #daliy report
  get "/reports", to: "reports#index"

  #show single day
  get "/reports/:id", to: "reports#show"

  #post card id
  post "/cards/:value/:token", to: "cards#create", as: "create_card"
end

