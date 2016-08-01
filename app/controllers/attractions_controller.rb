class AttractionsController < ApplicationController
  load_and_authorize_resource

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction.save
      redirect_to attraction_path(attraction), :notice => "Attraction created successfully."
    else
      flash[:alert] = "Unable to create that attraction."
      render 'new'
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = @attraction.rides.build
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
