class EventsController < ApplicationController
    def index
        @events = Event.all.order(start_time: :asc)
      end
    
      def show
        @event = Event.friendly.find(params[:slug])
      end
end
