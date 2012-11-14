module Travelport::Response
  class HotelDetailsRsp < Base

    def process
    end

    protected
    def raw_content
      @raw_content[:hotel_details_rsp]
    end
  end
end