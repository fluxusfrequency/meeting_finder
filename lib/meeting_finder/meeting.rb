module MeetingFinder
  class Meeting
    attr_reader :name, :location, :address, :day, :time, :lat, :lng
    def initialize(attributes={})
      @name = attributes['name']
      @location = attributes['location']
      @address = attributes['address']
      @day = attributes['day']
      @time = attributes['time']
      @lat = attributes['lat']
      @lng = attributes['lng']
    end
  end
end
