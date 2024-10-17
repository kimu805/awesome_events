class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_event, only: [:edit, :update, :show, :destroy]

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "「#{@event.name}」を作成しました。"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "「#{@event.name}」を編集しました。"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :content, :start_at, :end_at)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
