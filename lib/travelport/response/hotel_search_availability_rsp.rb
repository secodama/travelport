module Travelport::Response
  class HotelSearchAvailabilityRsp < Base

    def process
    end

    protected
    def raw_content
      @raw_content[:hotel_search_availability_rsp]
    end
  end
end