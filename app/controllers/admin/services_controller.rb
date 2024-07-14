module Admin
    class ServicesController < Admin::ApplicationController
      before_action :set_service, only: [:update_category]

      def index
        @services = Service.all
        if params[:group].present?
          @settings = Setting.where(group: params[:group])
        else
          @settings = Setting.all
        end
      end
  
      def new
        @service = Service.new
      end
  
      def create
        @service = Service.new(service_params)
        if @service.save
          redirect_to admin_services_path, notice: 'Service was successfully created.'
        else
          render :new
        end
      end

      def edit
        @service = Service.find_by_slug(params[:id])
      end
  
      def update
        @service = Service.find(params[:id])

        if @service.update(service_params)
          redirect_to admin_services_path, notice: 'Service was successfully updated.'
        else
          render :edit
        end
      end

      def update_category
        if @service.update(service_params)
          render json: { success: true }
        else
          render json: { success: false }
        end
      end

      def destroy
        @service = Service.find(params[:id])
        
        @service.destroy
        redirect_to admin_services_path, notice: 'Service was successfully deleted.'
      end
  
      private
  
      def set_service
        @service = Service.find(params[:id])
      end

      def service_params
        params.require(:service).permit(:title, :content, :featured_image, :category_id)
      end
    end
  end
  