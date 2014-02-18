require './spec/spec_helper'

describe MeetingFinder::Search do

  describe '#find_by' do
    it "should find by with valid params" do
      VCR.use_cassette('find_by') do
        result = MeetingFinder::Search.find_by({"latitude" => 39.7316982, "longitude" => -104.9213643})
        expect(result.first.name).to eq('COHO Building')
      end
    end
  end

end