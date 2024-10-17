class EventsController < ApplicationController
  before_action -> {
    authenticate_user! except: [:show],
    set_event only: [:show, :edit, :update, :destroy]
  }
  before_action :authenticate_user!, except: [:show]

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "#{@event.name}を作成しました。"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :content, :start_at, :end_at)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
