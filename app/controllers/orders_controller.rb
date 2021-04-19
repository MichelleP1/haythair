class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = current_user
    @order = Order.new(user_id: @user.id, pst: Province.find(@user.province_id).pst, hst: Province.find(@user.province_id).hst, gst: Province.find(@user.province_id).gst)
    @order.save
    # logger.debug(params[:order_id])
    redirect_to order_items_create_path(order_id: @order.id, pst: @order.pst, hst: @order.hst, gst: @order.gst)
  end

  def update
  end

  def destroy
  end


  private

  def order_params
    params.permit(:user_id, :pst, :hst, :gst)
  end
end
