class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @user = current_user.id
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
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
      :phone_number,:item_id,:user_id,:authenticity_token, :hoge, :commit
    )
    .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
