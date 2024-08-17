class HomeController < ApplicationController

    def index
        @articles = Article.all
        @services = Service.all
        @homepage_services = Service.joins(:category).where(categories: { name: 'home-page' })
        @contact_message = ContactMessage.new
        @testimonials = Testimonial.by_category_name('home-page')
        @sections = Section.all
        @events = Event.all
        
    end

end