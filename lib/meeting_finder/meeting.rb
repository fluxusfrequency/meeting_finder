module MeetingFinder
  class Meeting
    attr_reader :name, :location, :address, :day, :time, :fellowship
    def initialize(attributes={})
      @name = attributes['name']
      @location = attributes['location']
      @address = attributes['address']
      @day = attributes['day']
      @time = attributes['time']
      @fellowship = attributes['fellowship']
    end
  end
end