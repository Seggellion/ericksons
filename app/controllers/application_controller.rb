class ApplicationController < ActionController::Base
    before_action :set_services
    before_action :load_menu


    private

    def set_services
        @services = Service.all
    end

    
    def load_menu
        @header_menu_items = Menu.for_location('header')
        @footer_menu_items = Menu.for_location('footer')
      end

end
