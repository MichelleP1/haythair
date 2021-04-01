class FurnitureController < ApplicationController
  def index
    @furniture = Furniture.all.page(params[:page]).per(20)
    # @furniture = Kaminari.paginate_array(@furniture).page(params[:page]).per(5)
  end

  def show
    @furniture = Furniture.find(params[:id])
  end

  # def search
  #   @horses = Horse.where("name LIKE ?", "%#{params[:search_term]}%")
  # end
end
