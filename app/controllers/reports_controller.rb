class ReportsController < ApplicationController
    def index
        @reports = Report.all
        @employees = Employee.all
    end

    def show

    end
end