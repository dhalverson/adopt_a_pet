class WeatherService
  def self.current_forecast(zipcode)
    conn = Faraday.new(url: 'http://api.weatherapi.com')
    response = conn.get('/v1/current.json') do |req|
      req.params['key'] = ENV['WEATHER_API_KEY']
      req.params['q'] = zipcode
    end
    require 'pry'; binding.pry
    result  = JSON.parse(response.body, symbolize_names: true)
  end
end

