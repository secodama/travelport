class Travelport
  class Config

    attr_accessor :env
    attr_accessor :username
    attr_accessor :password
    attr_accessor :endpoint
    attr_accessor :target_branch
    attr_accessor :point_of_sale
    attr_accessor :document_dir

    DEFAULTS = {
      :test_americas => {
        :endpoint => 'https://americas.copy-webservices.travelport.com/B2BGateway/connect/uAPI/Service',
        :point_of_sale => 'uAPI'
      },
      :test_emea => {
        :endpoint => 'https://emea.copy-webservices.travelport.com/B2BGateway/connect/uAPI/Service',
        :point_of_sale => 'uAPI'
      },
      :test_apac => {
        :endpoint => 'https://apac.copy-webservices.travelport.com/B2BGateway/connect/uAPI/Service',
        :point_of_sale => 'uAPI'
      },
      :production_americas => {
        :endpoint => 'https://americas.universal-api.travelport.com/B2BGateway/connect/uAPI/Service',
        :point_of_sale => 'uAPI'
      },
      :production_emea => {
        :endpoint => 'https://emea.universal-api.travelport.com/B2BGateway/connect/uAPI/Service',
        :point_of_sale => 'uAPI'
      },
      :production_apac => {
        :endpoint => 'https://apac.universal-api.travelport.com/B2BGateway/connect/uAPI/Service',
        :point_of_sale => 'uAPI'
      }
    }.freeze

    def initialize
      self.env = :production_apac
    end

    def env=(value)
      @env = "#{value}".to_sym
      if defaults = DEFAULTS[@env]
        @endpoint = defaults[:endpoint]
        @point_of_sale = defaults[:point_of_sale]
        @username = @password = @target_branch = nil
      else
        # unrecognised env, reset config
        @endpoint = @username = @password = @point_of_sale = @target_branch = nil
      end
    end

    def uri
      URI.parse(endpoint)
    end

    def document_dir
      @document_dir || File.join(File.absolute_path(File.dirname(__FILE__)),'../../wsdl')
    end
  end

  class << self
    def config
      @@config ||= Config.new
    end

    def setup(&block)
      block.call(config) if block_given?
    end
  end
end
