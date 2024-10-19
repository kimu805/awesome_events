class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def new
    raise ActionController::RoutingError, "ログイン状態でTicketsController#newにアクセス"
  end
  
  def create
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = params[:ticket][:comment]
    end
    if @ticket.save
      redirect_to event, notice: "「#{event.name}」に参加を表明しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = current_user.tickets.find_by!(event_id: event.id)
    @ticket.destroy!
    redirect_to event_path(event), notice: "「#{event.name}」への参加を取り消しました"
  end

  private

  def set_event
    event = Event.find(params[:event_id])
  end
end
