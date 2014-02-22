require './spec/spec_helper'

describe MeetingFinder::Search do

  it "should find by with valid params" do
    VCR.use_cassette('find_by') do
      result = MeetingFinder::Search.find_by({"latitude" => 39.7316982, "longitude" => -104.9213643})
      first_meeting = result.first
      expect(first_meeting.name).to eq('Renovacion')
      expect(first_meeting.lat).to eq(39.7177958)
      expect(first_meeting.lng).to eq(-104.946666)
    end
  end

  it "should find by zip" do
    VCR.use_cassette('find_by_zip') do
      result = MeetingFinder::Search.by_zip(92109)
      first_meeting = result.first
      expect(first_meeting.name).to eq("Noontime on the Patio")
    end
  end

  it 'should be able to find lat and long' do
    VCR.use_cassette('find_lat_long') do
      result = MeetingFinder::Search.find_lat_long_from("1100 Fillmore StreetDenver, CO 80206-3334")
      expect(result).to eq([39.7338507, -104.9524757])
    end
  end


end
