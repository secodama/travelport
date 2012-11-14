require 'spec_helper'

describe Travelport::Bridge::Hotel do


  let(:bridge) { Travelport::Bridge::Hotel.new }

  context 'general search query' do
    use_vcr_cassette
    subject { bridge.search_availability('NYC', { checkin:Time.new + 5.days, checkout:Time.new+10.days, adults:1, rooms:1}) }
    it { should be_a(Travelport::Response::HotelSearchAvailabilityRsp) }
  end

  # context 'details query' do
  #   use_vcr_cassette
  #   subject { bridge.hotel_details('CP', '02743', { checkin:Time.new + 5.days, checkout:Time.new+10.days}) }
  #   it { should be_a(Travelport::Response::HotelDetailsRsp) }
  # end

end
