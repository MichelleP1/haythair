class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.save
    logger.debug(params[:order_id])
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
