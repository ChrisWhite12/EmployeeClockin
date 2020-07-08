class PagesController < ApplicationController
    before_action :print_params

    def print_params
        p params
    end
    
    def main
        if(current_user == nil)
            redirect_to "/users/sign_in"
        end
    end
end