class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart, :get_categories

  private

  def get_categories
    @categories = Category.all
  end

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Furniture.find(session[:shopping_cart])
  end
end
