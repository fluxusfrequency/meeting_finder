module MeetingFinder
  class Meeting
    attr_reader :name, :location, :address, :day, :time, :fellowship, :lat, :lng
    def initialize(attributes={})
      @name = attributes['name']
      @location = attributes['location']
      @address = attributes['address']
      @day = attributes['day']
      @time = attributes['time']
      @fellowship = attributes['fellowship']
      @lat = attributes['lat']
      @lng = attributes['lng']
    end
  end
end
