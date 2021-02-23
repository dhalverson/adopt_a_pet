class WeatherDetails
  def initialize(attr)
    @temp_f = attr[:current][:temp_f]
    @text = attr[:current][:condition][:text]
    @icon = attr[:current][:condition][:icon]
    require 'pry'; binding.pry
  end
end