require './spec/spec_helper'

describe MeetingFinder::Search do

  describe '#find_by' do
    it "should find by with valid params" do
      VCR.use_cassette('find_by') do
        result = MeetingFinder::Search.find_by({"latitude" => 39.7316982, "longitude" => -104.9213643})
        first_meeting = result.first
        expect(first_meeting.name).to eq('COHO Building')
      end
    end

    it "should find by zip" do 
      VCR.use_cassette('find_by_zip') do 
        result = MeetingFinder::Search.find_by({ "zip" => 80203 })
        first_meeting = result.first
        expect(first_meeting.name).to eq('Martinson Christian Church')
      end
    end
  end

end
