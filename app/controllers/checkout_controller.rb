class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def index
    @province = ""


  end

  def show
  end

end
