require 'savon'
require 'travelport/wasabi/parser'
module Travelport::Bridge
  class Base

    include Travelport::Model::DefaultFor

    attr_accessor :document
    attr_accessor :service

    def send_request(req_obj)
      req_obj.target_branch = Travelport.config.target_branch
      req_obj.billing_point_of_sale = Travelport.config.point_of_sale
      raise Travelport::Exceptions::BadRequest, "Request #{req_obj.request_name} is wrong(#{req_obj.errors.to_a})" unless req_obj.valid?
      client.call(:service, req_obj.request_attributes).body
    end

    protected
    def client
      @client ||= Savon.client do |globals|
        globals.endpoint Travelport.config.endpoint.gsub('Service', service)
        globals.wsdl File.join(Travelport.config.document_dir, document)
        globals.ssl_verify_mode :none
        globals.basic_auth [ Travelport.config.username, Travelport.config.password ]
      end
    end
  end
end
