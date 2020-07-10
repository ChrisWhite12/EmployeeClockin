class CardsController < ApplicationController
    before_action :print_params
    skip_before_action :verify_authenticity_token               ##don't forget to remove*****

    def print_params
        p "***********"
        p params
        p "***********"
    end

    def create
        #if the card does exist and there is a setting value (matches employee) - don't change anything except status to set
        #if the card does exist and there is a setting value (doesn't match employee) - card already set by other user
        #if the card does exist there isn't a setting value - clock in and out

        #if the card doesn't exist and there is a setting value (has no card) - set card to user
        #if the card doesn't exist and there is a setting value (has card) - delete old card, set card to user
        #if the card doesn't exist there isn't a setting value - error

        card_check = Card.find_by(card_value: params[:value])
        setting_find = Employee.find_by(card_status: "setting")
        p "card_check----"
        pp card_check
        p "setting_find----"
        pp setting_find


        if card_check       #card exists
            if setting_find             #if there is a setting value
                if card_check.employee[:card_status] == "setting"       #matches employee
                    #don't change anything except status to set
                    setting_find.update(card_status: "set")
                    render plain: "card already set"
                else                                                            #doesn't match employee
                    #card already set by other user
                    render plain: "card already set by other user"
                end
            else                                                    #if there isn't a setting value
                # clock in and out
                card_temp = Card.find_by(card_value: params[:value])
                r1 = Report.create(report_time: "8:00", report_date: "7/7/2020", report_type: "Clock In", card_id: card_temp[:id])
                render plain: "clocked in"
            end

        else                                                #card doesn't exist
            if setting_find
                p "--in if--"
                card_of_setting_find = Card.find_by(employee_id: setting_find[:id])

                if card_of_setting_find
                    p card_of_setting_find[:card_value]
                    card_of_setting_find.destroy                #delete current card
                    p "-------deleted card----------"
                end

                c1 = Card.create(card_value: params[:value], employee_id: setting_find[:id])
                r1 = Report.create(report_time: "8:00", report_type: "setup", card_id: c1[:id])
                setting_find.update(card_status: "set")
                #display text
                render plain: "set card"

            elsif !setting_find
            #error - do nothing
                p "Error - no setting value in employees"
                render plain: "Error - no setting value in employees"
            end

            byebug
        end
    end
end