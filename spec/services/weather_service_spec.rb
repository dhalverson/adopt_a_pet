require 'rails_helper'

RSpec.describe WeatherService do
  it 'can return weather details for a zipcode' do
    VCR.use_cassette('weather_zipcode') do
      city = 'Denver'
      weather_results = WeatherService.current_forecast(city)

      expect(weather_results).to be_a(Hash)
      expect(weather_results).to have_key :location
      expect(weather_results).to have_key :current

      current_forecast = weather_results[:current]
      expect(current_forecast).to be_a(Hash)
      expect(current_forecast).to have_key :temp_f
      expect(current_forecast[:temp_f]).to be_a(Float)
      expect(current_forecast).to have_key :condition
      expect(current_forecast[:condition]).to be_a(Hash)
      expect(current_forecast[:condition]).to have_key :text
      expect(current_forecast[:condition][:text]).to be_a(String)
      expect(current_forecast[:condition]).to have_key :icon
      expect(current_forecast[:condition][:icon]).to be_a(String)
    end
  end
end
