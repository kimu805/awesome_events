# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def authorization
    @user = User.from_omniauth(request.env["omniauth.auth"])
  end
end
