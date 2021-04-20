class FurnituresController < ApplicationController
  def index
    @furniture = Furniture.all.page(params[:page]).per(20)
    @q = Furniture.ransack(params[:q])
    @furnitures = @q.result(:distinct => true).includes(:category).page(params[:page]).per(20)
  end

  def show
    @q = Furniture.ransack(params[:q])
    @furnitures = @q.result(:distinct => true).includes(:category).page(params[:page]).per(20)
    @furniture = Furniture.find(params[:id])
  end

  def search
    index
    render :index
  end
end