
class WinesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:type].present?
      @wines = Wine.where("wine_type ILIKE ?", "%#{params[:type]}%")
    else
      @wines = Wine.all
    end
    @white_wines = @wines.select {|wine| wine[:wine_type].downcase == "white"}
    @red_wines = @wines.select {|wine| wine[:wine_type].downcase == "red"}
    @champagne = @wines.select {|wine| wine[:wine_type].downcase == "champagne"}
    @rose = @wines.select {|wine| wine[:wine_type].downcase == "rose"}
    @prosecco = @wines.select {|wine| wine[:wine_type].downcase == "prosecco"}
    @sparkling = @wines.select {|wine| wine[:wine_type].downcase == "sparkling"}
  end

  def show
    @wine = Wine.friendly.find(params[:id])
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      qr_code = RQRCode::QRCode.new(URI.parse(request.original_url).host + "/wines/" + @wine.friendly_id)
      png = qr_code.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: 'black',
        file: nil,
        fill: 'white',
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 300
      )
      @wine.qr_code = Base64.encode64(png.to_s)
      @wine.save
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
    @wine = Wine.friendly.find(params[:id])
    @wine.update(wine_params)
    redirect_to wine_path(@wine)
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :wine_type, :vineyard, :description, :organic, :biodynamic, :serving_temperature, :price, :guard, :weight, :region, :slug, :photo, product_information: [], food_pairings: [], tasting_notes: [], allergens: [])
  end
end
