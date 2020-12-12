class PurchasesController < ApplicationController
  def index
    @purchaser = Purchaser.new
  end
  def create
    @purchaser = Purchaser.new(purchaser_params)
    if @purchaser.valid?
      @purchaser.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def purchaser_params
    params.require(:purchaser).permit(:postal_code, :prefecture_id, :city, :address, :building, :purchase_id).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
