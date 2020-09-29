class EventsListsController < ApplicationController

    def new
        @el = EventsList.new
        @events = Event.all
        @users = User.all
    end

    def create
        el_new = EventsList.new(el_params)
        if !el_new.valid?
            flash[:errors] = "You are already RSVP'd for this event"
            redirect_to event_path(el_params[:event_id])
        else
            el_new.save
            redirect_to user_path(el_new.user_id)
        end
    end

    private

    def el_params
        params.require(:events_list).permit(:user_id, :event_id)
    end

end
