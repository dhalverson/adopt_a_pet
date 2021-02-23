require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it 'returns a forecast object for a zipcode' do
    VCR.use_cassette('weather_forecast') do
      zipcode = 80120
      forecast = WeatherFacade.get_weather_forecast(zipcode)

      expect(forecast).to be_a(WeatherDetails)
      expect(forecast.temp_f).to be_a(Float)
      expect(forecast.text).to be_a(String)
      expect(forecast.icon).to be_a(String)
    end
  end
end