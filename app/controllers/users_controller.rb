class UsersController < ApplicationController
  before_action :set_user, only: [:library, :purchase]

  def library
  end

  def purchase
    if (@purchase = @user.purchase(content: params[:content], quality: params[:quality]))
      render :purchase, status: :created#, location: @purchase
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def purchase_params
  #   params.require(:user).permit(:id, :conten, :quality)
  # end
end
