require 'rails_helper'

RSpec.describe WeatherService do
  it 'can return weather details for a zipcode' do
    VCR.use_cassette('weather_zipcode') do
      weather_results = WeatherService.zipcode_forecast

      expect(weather_results).to be_a(Hash)
    end
  end
end