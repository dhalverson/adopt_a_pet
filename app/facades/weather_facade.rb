class WeatherFacade
  def self.get_weather_forecast(zipcode)
    forecast_data = WeatherService.current_forecast(zipcode)
      WeatherDetails.new(forecast_data)
  end
end
