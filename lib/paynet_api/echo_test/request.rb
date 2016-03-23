module PaynetApi
  module EchoTest
    class Request < PaynetApi::BaseRequest

      def wsdl
        "#{base_url}/WsAccurint/EchoTest?wsdl"
      end

      def initialize value_in = nil
        @value_in=value_in
      end

      def as_xml
        "<ValueIn>#{@value_in}</ValueIn>"
      end
    end
  end
end