require 'spec_helper'

describe Travelport::Bridge::Hotel do

  set_test_api_credentials

  let(:bridge) { Travelport::Bridge::Hotel.new }

  context 'general search query' do
    use_vcr_cassette
    it 'should send base search request' do
      resp = bridge.search_availability({location:'NYC', checkin:Time.new + 5.days, checkout:Time.new+10.days, adults:1, rooms:1})
      resp.should be_a(Travelport::Response::HotelSearchAvailabilityRsp)
    end

  end
end
