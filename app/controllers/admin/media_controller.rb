module Admin
    class MediaController < Admin::ApplicationController
      def index
        @files = ActiveStorage::Blob.all
      end
  
      def destroy
        @file = ActiveStorage::Blob.find(params[:id])
        @file.purge
        redirect_to admin_media_index_path, notice: 'File was successfully deleted.'
      end
    end
  end
  