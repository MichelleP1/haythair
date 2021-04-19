class OrderItemsController < ApplicationController

  def create
    session[:shopping_cart].each do |furniture|
      @order_id = params[:order_id]
      @order = Order.find(@order_id)
      logger.debug(params[:order_id])
      @order_item = OrderItem.new(:quantity => furniture[1], :price => Furniture.find(furniture[0]).price, :order_id => params[:order_id], :furniture_id => furniture[0])
      @order_item.save
    end
    # redirect_to checkout_create_path(order_id: @order.id, pst: @order.pst, hst: @order.hst, gst: @order.gst)
    #format.js { redirect_to current_user }
  end

  def update
  end

  def delete
  end

  def order_item_params
    params.permit(:order_id, :pst, :hst, :gst)
  end
end
