module Admin
    class PagesController < ApplicationController
      before_action :set_page, only: [:update_category]
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
        @page = Page.find_by_slug(params[:id])
      end
  
      def update
        @page = Page.find_by_slug(params[:id])
        if @page.update(page_params)
           redirect_to edit_admin_page_path(@page), notice: 'Page was successfully updated.'
        end
      end

      def update_category

        if @page.update(page_params)
          render json: { success: true }
        else
          render json: { success: false }
        end
      end

  
      def destroy
        @page = Page.find(params[:id])
        @page.destroy
        redirect_to admin_pages_path, notice: 'Page was successfully deleted.'
      end
  
      private
  
      def set_page
        
        @page = Page.find(params[:id])
      end

      def page_params
        params.require(:page).permit(:title, :content, :category_id, :meta_description, :meta_keywords, images: [], remove_images: []).merge(user_id: 1)

      end
    end
  end
  