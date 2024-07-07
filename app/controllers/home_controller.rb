class HomeController < ApplicationController

    def index
        @articles = Article.all
        @services = Service.all
        @footer_menu_items = Menu.for_location('footer')
    end

end