module Travelport::Response
  class Base

    def initialize(raw_content)
      @raw_content = raw_content
      process unless @raw_content.nil?
    end

    # Returns the expected response content element
    def content_selector
      self.class.name.underscore.split('/').last.to_sym
    end

    def raw_content
      @raw_content[content_selector]
    end

  end
end
