module PaynetApi
  class BaseResponse
    attr_reader :response_xml, :request_xml

    def initialize response_xml = "", request_xml = ""
      @response_xml = Nokogiri::XML("#{response_xml}")
      @request_xml  = Nokogiri::XML("#{request_xml}")
    end

    def nori
      @nori ||= Nori.new(:convert_tags_to => lambda { |tag| tag.snakecase.to_sym })
    end
  end
end
