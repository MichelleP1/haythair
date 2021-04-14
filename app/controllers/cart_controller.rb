class CartController < ApplicationController
  def create
    logger.debug("Adding")
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    session[:shopping_cart] << id
    session[:shopping_cart] << quantity
    furniture = Furniture.find(id)
    flash[:notice] = "+ Added #{quantity} #{furniture.title} to the cart."
    redirect_to root_path
  end

  def destroy
    logger.debug("Destroying")
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    furniture = Furniture.find(id)
    flash[:notice] = "- Removed #{furniture.title} from the cart."
    redirect_to root_path
  end
end
