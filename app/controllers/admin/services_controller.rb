module Admin
    class ServicesController < Admin::ApplicationController
      def index
        @services = Service.all
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
        @service = Service.find(params[:id])
      end
  
      def update
        @service = Service.find(params[:id])
        
        if @service.update(service_params)
            puts "output"
            Rails.logger.debug "Service params: #{service_params.inspect}"

          redirect_to admin_services_path, notice: 'Service was successfully updated.'
        else
          render :edit
        end
      end

      def destroy
        @service = Service.find(params[:id])
        
        @service.destroy
        redirect_to admin_services_path, notice: 'Service was successfully deleted.'
      end
  
      private
  
      def service_params
        params.require(:service).permit(:title, :content, :featured_image, category_ids: [])
      end
    end
  end
  