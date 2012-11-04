class Travelport::Config

	attr_accessor :login
	attr_accessor :password
	attr_accessor :target_branch
	attr_accessor :endpoint
	attr_accessor :point_of_sale
	attr_accessor :document_dir

  def document_dir
    @document_dir || File.join(File.absolute_path(File.dirname(__FILE__)),'../../wsdl')
  end
end