class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @user = current_user.id
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.permit(
      :postal_code,:prefecture_id,:city,:house_number,:building_name,
      :phone_number,:item_id,:user_id,:authenticity_token, :commit, :price,  :number, :exp_month, :exp_year, :cvc, :token
    )
    .merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
