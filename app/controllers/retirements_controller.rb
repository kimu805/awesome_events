class RetirementsController < ApplicationController

  def new
  end

  def create
    if current_user.destroy
      redirect_to root_path, notice: "退会完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
