class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def index
    @province = User.find(current_user.id).province_id

    # unless User.find_by(current_user.id).province_id.exists?
    #   @province = Province.find(User.find(current_user.id).province_id)
    # end


  end

  def show
  end


end
