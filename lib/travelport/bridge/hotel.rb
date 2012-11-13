module Travelport::Bridge
  class Hotel < Base

    default_for :service, 'HotelService'
    default_for :document, 'hotel_v19_0/Hotel.wsdl'

    def search_availability(options)
      options.assert_valid_keys(:location, :adults, :rooms, :checkin, :checkout)
      req = Travelport::Request::HotelSearchAvailabilityReq.new do |obj|
        obj.location = options[:location]
        obj.adults = options[:adults]
        obj.rooms = options[:rooms]
        obj.checkin = options[:checkin]
        obj.checkout = options[:checkout]
      end
      Travelport::Response::HotelSearchAvailabilityRsp.new(send_request(req))
    end

  end
end