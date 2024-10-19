class TicketsController < ApplicationController
  before_action :authenticate_user!

  def new
    raise ActionController::RoutingError, "ログイン状態でTicketsController#newにアクセス"
  end
  
  def create
    event = Event.find(params[:event_id])
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
end
