class HomeController < ApplicationController

    def index
        @articles = Article.all
        @services = Service.all
        @homepage_services = Service.joins(:category).where(categories: { name: 'home-page' })
        @footer_menu_items = Menu.for_location('footer')
        @testimonials = Testimonial.by_category_name('home-page')
        @sections = Section.all
    end

end