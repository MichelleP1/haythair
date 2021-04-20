class CartController < ApplicationController


  def create
    logger.debug("Adding")
    id = params[:id].to_i
    session[:shopping_cart] << [id, 1]
    furniture = Furniture.find(id)
    flash[:notice] = "+ Added #{furniture.title} to the cart."
    redirect_to root_path
  end

  def update
    logger.debug("Updating")
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    session[:shopping_cart].each do |item|
      item[1] = quantity if item[0] == id
    end
    redirect_to checkout_index_path
  end

  def destroy
    logger.debug("Destroying")
    id = params[:id].to_i
    session[:shopping_cart].each_with_index do |items, index|
      session[:shopping_cart].delete_at(index) if items[0] == id
    end
    # session[:shopping_cart].delete(id)
    furniture = Furniture.find(id)
    flash[:notice] = "- Removed #{furniture.title} from the cart."
    redirect_to root_path
  end

  def quantityIncrease
    id = params[:id].to_i
    session[:shopping_cart].each do |item|
      item[1] += 1 if item[0] == id
    end
  end

  def quantityDecrease
    id = params[:id].to_i
    session[:shopping_cart].each do |item|
      item[1] -= 1 if item[0] == id
    end
  end
end
