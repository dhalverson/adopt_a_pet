class WeatherFacade
  def self.get_weather_forecast(zipcode)
    forecast = WeatherService.current_forecast(zipcode)
      WeatherDetails.new(forecast)
  end
end
