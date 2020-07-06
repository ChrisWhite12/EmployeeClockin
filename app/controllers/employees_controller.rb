class EmployeesController < ApplicationController
    before_action :print_params
    # after_action :print_db

    def print_params
        p "***********"
        p params
        p "***********"
    end

    def print_db
        pp Employee.all
    end

    def new
        
    end

    def index
        @employees = Employee.all
    end 

    def show
        
    end

    
    
    def edit
        @employee = Employee.find(params[:id])
        if Card.find_by(employee_id: params[:id])
            @card = Card.find_by(employee_id: params[:id])[:card_value]
        else
            @card = ''
        end
        p @card
        p "--------------"
        p @employee
    end
    
    def update
        emp_update = Employee.find_by(id: (params[:id]).to_i)
        p ")))) emp_update"
        p emp_update
        emp_update.update(fname: params[:employee][:fname])
        emp_update.update(lname: params[:employee][:lname])
        emp_update.update(hrrate: params[:employee][:hrrate].to_f)
        redirect_to employees_path
    end

    def create
        # @employee = Employee.new(params[:employee])
        @employee = Employee.create([
        fname: params[:employee][:fname],
        lname: params[:employee][:lname],
        hrrate: params[:employee][:hrrate].to_f]
        )
        redirect_to employees_path
    end

    def setcard
        emp_update = Employee.find_by(id: (params[:id]).to_i)
        p ")))) emp_update"
        p emp_update
        emp_update.update(card_status: "setting")
        redirect_to edit_employee_path(params[:id])
    end

    
end