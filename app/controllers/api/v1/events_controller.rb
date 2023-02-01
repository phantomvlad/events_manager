module Api
  module V1
    class EventsController < ApiController
      def index
        @events = Event.all
      end

      def create
        @event = Event.new(event_params)
        @event.user = current_user

        unless @event.save
          respond_with_errors(@event)
        end
      end

      private

      def event_params
        params.require(:event).permit(:title, :description, :address, :datetime)
      end
    end
  end
end
