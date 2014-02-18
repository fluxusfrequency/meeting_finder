require 'nokogiri'
require 'open-uri'
require 'geocoder'

module MeetingFinder
  class Search
    class << self

      def find_by(values={})
        search_string = values.map do |parameter, value|
          "&#{parameter}=#{value}"
        end.join
        response = Nokogiri::HTML(open(search_url + search_string))
        meetings = []
        response.css('.all-meetings tr').each_with_object({}) do |meeting, attributes|
          attributes['name'] = meeting.children[0].text
          attributes['location'] = meeting.children[2].text
          attributes['address'] = meeting.children[4].text
          attributes['day'] = meeting.children[6].text
          attributes['time'] = meeting.children[8].text
          attributes['fellowship'] = meeting.children[10].text
          attributes['lat'], attributes['lng'] = find_lat_long_from(attributes['address'])
          meetings << MeetingFinder::Meeting.new(attributes)
        end
        meetings.shift
        meetings
      end

      def find_lat_long_from(address)
        result = Geocoder.search(address)
        location = result.first.data["geometry"]["location"]
        lat, lng = location["lat"], location["lng"]
        [lat, lng]
      end

      def by_lat_lng(lat, lng)
        find_by({ "latitude" => lat, "longitude" => lng })
      end

      def by_zip(zip)
        find_by({ "zip" => zip })
      end

      def search_url
        'http://meetings.intherooms.com/meetings/search?search=&proximity=10'
      end

    end
  end
end

# http://meetings.intherooms.com/meetings/search?search=
# &fellowship=AA
# &zip=80220
# &proximity=500
# &day=
# &start_hour=1
# &start_min=00
# &start_am_pm=AM
# &end_hour=1
# &end_min=00
# &end_am_pm=AM
# &latitude=39.7316982
# &longitude=-104.9213643
# &process=1
# &page_city=
# &page_state=
