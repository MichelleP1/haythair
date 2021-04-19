class FurnituresController < ApplicationController
  def index
    @furniture = Furniture.all.page(params[:page]).per(20)
    # @furniture = Kaminari.paginate_array(@furniture).page(params[:page]).per(5)
    @q = Furniture.ransack(params[:q])
    @furnitures = @q.result(:distinct => true).includes(:category).page(params[:page]).per(20)
  end

  def show
    @q = Furniture.ransack(params[:q])
    @furnitures = @q.result(:distinct => true).includes(:category).page(params[:page]).per(20)
    @furniture = Furniture.find(params[:id])
  end

  # def search
  #   @horses = Horse.where("name LIKE ?", "%#{params[:search_term]}%")
  # end

  def search
    index
    render :index
  end
end