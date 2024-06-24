class HomeController < ApplicationController

    def index
        @articles = Article.all
        @services = Service.all
    end

end