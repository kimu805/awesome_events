class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_event, only: [:edit, :update, :destroy]

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "「#{@event.name}」を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @ticket = current_user.tickets.find_by(event: @event)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "「#{@event.name}」を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy!
    redirect_to root_path, notice: "「#{@event.name}」を削除しました。"
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :content, :start_at, :end_at)
  end

  def set_event
    @event = current_user.created_events.find(params[:id])
  end
end
