class UsersController < ApplicationController
  before_action :set_user, only: [:library, :purchase]

  def library
    @library = @user.library
  end

  def purchase
    if (@purchase = @user.purchase(content: params[:content], quality: params[:quality]))
      render :purchase, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
