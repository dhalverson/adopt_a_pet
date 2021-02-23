class WeatherDetails
  attr_reader :temp_f,
              :text,
              :icon
  def initialize(attr)
    @temp_f = attr[:current][:temp_f]
    @text = attr[:current][:condition][:text].downcase
    @icon = attr[:current][:condition][:icon]
  end
end