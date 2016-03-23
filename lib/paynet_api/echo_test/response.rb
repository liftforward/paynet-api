module PaynetApi
  module EchoTest
    class Response < PaynetApi::BaseResponse

      def initialize response_xml, request_xml
        @response_xml = Nokogiri::XML(response_xml)
        @request_xml  = Nokogiri::XML(request_xml)
      end

      def as_xml
        return @response_xml
      end

      def success?
        #TODO implement something that determines if there was an error
        true
      end

      def value_out
        @response_xml.xpath("//et:ValueOut", "et" => "http://webservices.seisint.com/WsAccurint" ).text
      end

    end
  end
end
