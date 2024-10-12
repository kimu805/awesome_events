# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  end

  private
  def authorization
    @user = User.from_omniauth(request.env["omniauth.auth"])
  end
end
