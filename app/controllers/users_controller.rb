class UsersController < ApplicationController
  def create
  end

  def update
    logger.debug(user_params)
    @user = User.find_by(id: current_user.id)
    @user.update(user_params)
    redirect_to checkout_index_path
  end

  def user_params
    params.permit(:province_id, :address, :postal, :city)
  end
end
