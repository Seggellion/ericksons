class ApplicationController < ActionController::Base
    before_action :set_services

    private

    def set_services
        @services = Service.all
    end

end
