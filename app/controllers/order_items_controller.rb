class OrderItemsController < ApplicationController

  def create
    session[:shopping_cart].each do |furniture|
      @order_id = :order_id
      logger.debug(params[:order_id])
      @order_item = OrderItem.new(:quantity => furniture[1], :price => Furniture.find(furniture[0]).price, :order_id => params[:order_id], :furniture_id => furniture[0])
      @order_item.save
    end
  end

  def update
  end

  def delete
  end

  def order_item_params
    params.permit(:order_id)
  end
end
