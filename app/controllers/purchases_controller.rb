class PurchasesController < ApplicationController
  def index
    @purchaser = PurchaserForm.new
    @product = Product.find(params[:product_id])
  end

  def create
    @purchaser = PurchaserForm.new(purchaser_params)
    @product = Product.find(params[:product_id])
    if @purchaser.valid?
      pay_product
      @purchaser.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchaser_params
    params.require(:purchaser_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product[:price],
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end
end
