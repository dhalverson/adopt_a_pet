require 'rails_helper'

RSpec.describe WeatherDetails do
  it 'can create a WeatherDetails object' do
    attr = {
      :location=>{:name=>"Denver", :region=>"Colorado", :country=>"USA", :lat=>39.68, :lon=>-104.89, :tz_id=>"America/Denver", :localtime_epoch=>1614111216, :localtime=>"2021-02-23 13:13"},
      :current=>
        {:last_updated_epoch=>1614110433,
        :last_updated=>"2021-02-23 13:00",
        :temp_c=>15.7,
        :temp_f=>60.3,
        :is_day=>1,
        :condition=>{:text=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png", :code=>1003},
        :wind_mph=>10.5,
        :wind_kph=>16.9,
        :wind_degree=>40,
        :wind_dir=>"NE",
        :pressure_mb=>1008.0,
        :pressure_in=>30.2,
        :precip_mm=>0.0,
        :precip_in=>0.0,
        :humidity=>16,
        :cloud=>50,
        :feelslike_c=>15.7,
        :feelslike_f=>60.3,
        :vis_km=>16.0,
        :vis_miles=>9.0,
        :uv=>2.0,
        :gust_mph=>10.1,
        :gust_kph=>16.2}}

        shelter_forecast = WeatherDetails.new(attr)

        expect(shelter_forecast).to be_a(WeatherDetails)
        expect(shelter_forecast.temp_f).to eq(60.3)
        expect(shelter_forecast.text).to eq('partly cloudy')
        expect(shelter_forecast.icon).to eq('//cdn.weatherapi.com/weather/64x64/day/116.png')
  end
end