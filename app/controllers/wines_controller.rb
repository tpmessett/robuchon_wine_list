class WinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @wines = Wine.all
  end

  def show
    @wine = Wine.friendly.find(params[:id])
  end

  def new
    @wine = Wine.new
  end

  def create
    @Wine = Wine.new(wine_params)
    if @wine.save
      redirect_to wine_path(@wine)
    else
      render :new
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
  end

  def update
    @wine = Wine.find(params[:id])
    @wine.update(wine_params)
    redirect_to wine_path(@wine)
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :type, :vineyard, :description, :organic, :biodynamic, :serving_temperature, :price, :guard, :weight, :region, :product_information, :food_pairings, :tasting_notes, :allergens, :qr_code, :slug)
  end
end
