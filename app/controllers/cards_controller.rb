class CardsController < ApplicationController
    before_action :print_params
    skip_before_action :verify_authenticity_token

    def print_params
        p "***********"
        p params
        p "***********"
    end

    def create
        #check if new card or existing card (card_value)
        if Card.find_by(card_value: params[:value]) && !Employee.find_by(card_status: "setting")              #if the card exists and no employee has "setting"

            card_temp = Card.find_by(card_value: params[:value])
            r1 = Report.create(report_time: "8:00", report_type: "Clock In", card_id: card_temp[:id])

        # elsif Card.find_by(card_value: params[:value]) && Employee.find_by(card_status: "setting")

        else

            emp_update = Employee.find_by(card_status: "setting")           #find the employee that is setting the card
            c1 = Card.create(card_value: params[:value], employee_id: emp_update[:id])
            r1 = Report.create(report_time: "8:00", report_type: "setup", card_id: c1[:id])
            emp_update.update(card_status: "set")
        end
    end
end