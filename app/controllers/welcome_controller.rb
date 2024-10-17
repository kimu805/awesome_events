class WelcomeController < ApplicationController

  def index
    @events = Event.not_started.recent
  end
end
