class HomeController < ApplicationController

    def index
        @articles = Article.all
        @services = Service.all
        @footer_menu_items = Menu.for_location('footer')
        @testimonials = Testimonial.by_category_name('home-page')

    end

end