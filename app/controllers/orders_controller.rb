class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    #@order_item = @order.order_items.new(order_params)
    @order.save
    #session[:order_id] = @order.id
  end

  def update
    # @order = current_order
    # @order_item = @order.order_items.find(params[:id])
    # @order_item.update(order_params)
    # @order_items = current_order.order_items
  end

  def destroy
    # @order = current_order
    # @order_item = @order.order_items.find(params[:id])
    # @order_item.destroy
    # @order_items = current_order.order_items
  end


  private

  def order_params
    params.permit(:user_id)
    #params.permit(:user_id, :authenticity_token)
  end
end
