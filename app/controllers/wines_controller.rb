class WinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @wines = Wine.all
  end

  def show
    @wine = Wine.friendly.find(params[:id])
    @qr_code = RQRCode::QRCode.new(request.original_url)
    @svg = @qr_code.as_svg(
      shape_rendering: 'crispEdges',
      standalone: true
    )

  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)

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
    params.require(:wine).permit(:name, :wine_type, :vineyard, :description, :organic, :biodynamic, :serving_temperature, :price, :guard, :weight, :region, :slug, product_information: [], food_pairings: [], tasting_notes: [], allergens: [])
  end
end
