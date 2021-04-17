class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  before_action :initialize_session
  helper_method :cart, :get_categories

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
    Furniture.find(session[:shopping_cart])
  end
end
