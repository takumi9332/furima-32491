class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  def index
    @purchaser = PurchaserForm.new
    if current_user.id == @product.user_id || @product.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchaser = PurchaserForm.new(purchaser_params)
    if current_user.card.present?
      pay_registration
    elsif @purchaser.valid?
      pay_product
    else
      render :index
      return
    end
    @purchaser.save
    redirect_to root_path
  end

  private
  def purchaser_params
    params.require(:purchaser_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product[:price],
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end

  def pay_registration
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   customer_token = current_user.card.customer_token
   Payjp::Charge.create(
     amount: @product[:price],
     customer: customer_token,
     currency: 'jpy' 
     )
  end
end
