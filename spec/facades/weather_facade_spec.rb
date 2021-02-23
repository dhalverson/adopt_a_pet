require 'rails_helper'

RSpec.describe 'Weather Facade' do
  it 'returns a forecast object for a zipcode' do
    VCR.use_cassette('weather_forecast') do
      zipcode = 80120
      forecast = WeatherFacade.get_weather_forecast(zipcode)

    end
  end
end