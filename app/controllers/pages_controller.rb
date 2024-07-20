class PagesController < ApplicationController
    before_action :set_page, only: [:show]
  
    def show
      # This will render app/views/pages/show.html.erb
    end

    def index
@pages = Page.all
    end
  
    private
  
    def set_page
      @page = Page.friendly.find(params[:slug])
    end
  end
  