class UsersController < ApplicationController
  before_action :set_user, only: [:library, :purchase]
  before_action :set_purchase_option, only: :purchase

  def library
    @library = @user.library
  end

  def purchase
    @purchase = @user.purchases.new(purchase_option: @purchase_option)
    if @purchase.save
      Purchase.reload_library
      @purchase.write_in_user_library
      render :purchase, status: :created
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_purchase_option
    @purchase_option = PurchaseOption.find_by(content: purchase_params[:content], quality: purchase_params[:quality])
  end

  def purchase_params
    params.permit :content, :quality
  end
  
end
