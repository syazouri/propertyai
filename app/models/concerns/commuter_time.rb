require 'open-uri'

class CommuterTime
  # attr_accessor :startcoord, :,

  def initialize(options = {})
    @startcoord = options[:startcoord].join(",")
    @endcoord = userInput.join(",")
    # @cityMapper = time_return
  end

  def userInput
    # @startcoord = [current_user.lat, current_user.lng]
    [51.52495000,-0.07543900]
  end

  def potential_area
    @endcoord = area_id
  end

  def cityMapper_api
    cityMapper_url = "https://developer.citymapper.com/api/1/traveltime/?startcoord=#{@startcoord}&endcoord=#{@endcoord}&key=#{ENV["CITYMAPPER"]}"
    time_return = JSON.parse(open(cityMapper_url).read)
  end
end
