module Admin
    class PagesController < ApplicationController
      def index
        @pages = Page.all
      end
  
      def new
        @page = Page.new
      end
  
      def create
        @page = Page.new(page_params)
        if @page.save
          redirect_to admin_pages_path, notice: 'Page was successfully created.'
        else
          render :new
        end
      end
  
      def edit
        @page = Page.find(params[:id])
      end
  
      def update
        @page = Page.find(params[:id])
        if @page.update(page_params)
          redirect_to admin_pages_path, notice: 'Page was successfully updated.'
        else
          render :edit
        end
      end
  
      def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to admin_pages_path, notice: 'Page was successfully deleted.'
      end
  
      private
  
      def page_params
        params.require(:page).permit(:title, :body)
      end
    end
  end
  