class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  helper_method :cart, :get_categories, :subtotal, :pst, :hst, :gst

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :postal, :address, :city,
               :province_id)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :password_confirmation, :postal, :address, :city,
               :province_id, :current_password)
    end
  end

  private

  def get_categories
    @categories = Category.all
  end



  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    #Furniture.find(session[:shopping_cart])
    shopping_cart = []
    session[:shopping_cart].each do |furniture|
      furnitureID = furniture[0]
      shopping_cart << [furnitureID, furniture[1]]
    end

    shopping_cart
  end

  def subtotal
    subtotal = 0
    session[:shopping_cart].each do |furniture|
      price = Furniture.find(furniture[0]).price
      subtotal += price
    end

    subtotal
  end

  def pst
    pst = Province.find(User.find(current_user.id).province_id).pst * 0.01
  end

  def hst
    hst = Province.find(User.find(current_user.id).province_id).hst * 0.01
  end

  def gst
    gst = Province.find(User.find(current_user.id).province_id).gst * 0.01
  end

end
