class FurnituresController < ApplicationController
  def index
    @furniture = Furniture.all.page(params[:page]).per(20)
    # @furniture = Kaminari.paginate_array(@furniture).page(params[:page]).per(5)

    @order_item = current_order.order_items.new
  end

  def show
    @furniture = Furniture.find(params[:id])
    @order_item = current_order.order_items.new
  end

  # def search
  #   @horses = Horse.where("name LIKE ?", "%#{params[:search_term]}%")
  # end
end