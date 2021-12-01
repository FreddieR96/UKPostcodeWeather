class WeatherResultsController < ApplicationController

  def show
    redirect_to root_url
  end

  def create
    @weather_result = WeatherResult.new(params[:postcode])
    if @weather_result.valid_uk_postcode
      render :show
    else
      flash[:alert] = "Please enter a valid UK postcode"
      redirect_to root_url
    end
  end
end
