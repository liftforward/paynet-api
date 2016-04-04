module PaynetApi
  class BaseResponse
    attr_reader :body, :status, :request, :xml

    def initialize(response_xml:, request:)
      @xml = response_xml
      @request = request
      # @status = response.status
      # @success = response.success?
    end


    def parsed_xml
      @parsed_xml ||= Hashie::Mash.new nori.parse(xml)
    end

    def nori
      @nori ||= Nori.new(:convert_tags_to => lambda { |tag| tag.snakecase.to_sym })
    end

    def error_code
      parsed_xml["response"]["error_code"] if parsed_xml && parsed_xml["response"] && parsed_xml["response"]["error_code"]
    end

    def version
      parsed_xml["response"]["version"] if parsed_xml && parsed_xml["response"] && parsed_xml["response"]["version"]
    end

    def status
    end
  end
end
