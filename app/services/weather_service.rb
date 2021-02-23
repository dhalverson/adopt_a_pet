class WeatherService
  def self.current_forecast(city)
    conn = Faraday.new(url: 'http://api.weatherapi.com')
    response = conn.get('/v1/current.json') do |req|
      req.params['key'] = ENV['WEATHER_API_KEY']
      req.params['q'] = city
    end
    result = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end

