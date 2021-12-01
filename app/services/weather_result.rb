class WeatherResult
  include HTTParty
  base_uri 'https://api.weatherapi.com'

  def initialize(postcode)
    @results = 
    self.class.get("/v1/forecast.json?key=#{ENV['weather_api_key']}&q=#{postcode.strip}")
    @postcode = postcode
  end

  def postcode
    @postcode
  end

  def valid_uk_postcode
    !(@results.has_key? 'error') && @results['location']['country'] == "UK"
  end

  def temperature
    result_temperature = @results['forecast']['forecastday'][0]['day']['maxtemp_c']
    if result_temperature < TemperatureThreshold.first.warm_temperature
      'cold'
    elsif result_temperature < TemperatureThreshold.first.hot_temperature
      'warm'
    else
      'hot'
    end
  end
end