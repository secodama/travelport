require 'spec_helper'

describe Travelport::Bridge::Hotel do

  set_test_api_credentials

  let(:bridge) { Travelport::Bridge::Hotel.new }

  context 'general search query' do
    use_vcr_cassette
    it 'should send base search request' do
      resp = bridge.search_availability('NYC', { checkin:Time.new + 5.days, checkout:Time.new+10.days, adults:1, rooms:1})
      resp.should be_a(Travelport::Response::HotelSearchAvailabilityRsp)
    end
  end

  context 'details query' do
    use_vcr_cassette
    it 'should send base search request' do
      resp = bridge.hotel_details('HY', '86178', { checkin:Time.new + 5.days, checkout:Time.new+10.days})
      resp.should be_a(Travelport::Response::HotelDetailsRsp)
    end
  end

end
